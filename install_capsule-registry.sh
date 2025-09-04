#!/bin/bash
# Installing the capsule agent
echo "🔧 Installing Capsule Agent..."
OWNER="Parallels"
REPO="capsule-registry"

# Default to stable releases
USE_PRERELEASE=false

# Parse additional arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --pre-release)
            USE_PRERELEASE=true
            shift
            ;;
        --uninstall)
            UNINSTALL=true
            shift
            ;;
        --version)
            VERSION="$2"
            shift
            shift
            ;;
        *)
            shift
            ;;
    esac
done

# Determine architecture
ARCH=$(uname -m)
case $ARCH in
    x86_64)
        BINARY_NAME="capsule-registry-linux-amd64"
        ;;
    aarch64)
        BINARY_NAME="capsule-registry-linux-arm64"
        ;;
    *)
        echo "❌ Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

function uninstall_capsule_registry() {
  # checking if the binary exists
  if [ -f "/usr/local/bin/capsule-registry" ]; then
    echo "✅ Capsule Registry already installed, uninstalling..."
    #stop the service
    sudo systemctl stop capsule-registry.service
    #remove the binary
    sudo rm -f /usr/local/bin/capsule-registry
    sudo rm -f /usr/local/bin/capsule-registry.env
    #remove the service file
    sudo rm -f /etc/systemd/system/capsule-registry.service
    #reload the systemd daemon
    sudo systemctl daemon-reload
    echo "✅ Capsule Registry uninstalled"
    else
      echo "❌ Capsule Registry not installed"
  fi
}

if [ "$UNINSTALL" = true ]; then
  uninstall_capsule_registry
  exit 0
fi

echo "🔄 Updating system..."
sudo apt-get update
sudo apt-get install -y jq curl sqlite3

uninstall_capsule_registry
if [ "$VERSION" != "" ]; then
  echo "✅ Using version: $VERSION"
  LATEST_RELEASE=$VERSION
else
  echo "✅ Using latest release"

  # Get release information
  echo "📦 Getting release information..."
  if [ "$USE_PRERELEASE" = true ]; then
      echo "🔍 Including pre-releases in search..."
      # Get all releases including pre-releases and sort by creation date
      LATEST_RELEASE=$(curl -s "https://api.github.com/repos/$OWNER/$REPO/releases" | \
          jq -r '.[0].tag_name')
  else
      echo "🔍 Looking for stable releases only..."
      LATEST_RELEASE=$(curl -s "https://api.github.com/repos/$OWNER/$REPO/releases/latest" | \
          jq -r '.tag_name')
  fi
fi

if [ -z "$LATEST_RELEASE" ] || [ "$LATEST_RELEASE" = "null" ]; then
    echo "❌ Failed to get release information"
    exit 1
fi

echo "📌 Selected release: ${LATEST_RELEASE}"

echo "📥 Downloading Capsule Agent ${LATEST_RELEASE}..."
DOWNLOAD_URL="https://github.com/$OWNER/$REPO/releases/download/${LATEST_RELEASE}/${BINARY_NAME}"
SIG_URL="${DOWNLOAD_URL}.sig"

# Create temporary directory
TMP_DIR=$(mktemp -d)
cd "$TMP_DIR" || exit

# Download binary and signature
curl -s -L -o "$BINARY_NAME" "$DOWNLOAD_URL"
curl -s -L -o "${BINARY_NAME}.sig" "$SIG_URL"

# TODO: Add signature verification here if needed

# Install binary
echo "📝 Installing Capsule Agent..."
sudo mv "$BINARY_NAME" /usr/local/bin/capsule-registry
sudo chmod +x /usr/local/bin/capsule-registry

# Clean up
cd - > /dev/null || exit
rm -rf "$TMP_DIR"
# creating the default environment file
cat << EOF > /usr/local/bin/capsule-registry.env
LXC_AGENT_DATABASE_MIGRATE=true
EOF

# Create service file
echo "🔧 Creating systemd service..."
sudo tee /etc/systemd/system/capsule-registry.service > /dev/null << EOF
[Unit]
Description=Capsule Agent Service
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
ExecStart=/usr/local/bin/capsule-registry -env /usr/local/bin/capsule-registry.env
Restart=always
RestartSec=10
User=root

[Install]
WantedBy=multi-user.target
EOF

# Enable and start service
echo "🚀 Starting Capsule Agent service..."
sudo systemctl daemon-reload
sudo systemctl enable capsule-registry.service
sudo systemctl start capsule-registry.service