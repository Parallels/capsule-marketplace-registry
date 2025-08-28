# Capsule Registry Service

This directory contains the Capsule Registry service, which handles capsule blueprints and downloads.

## Docker Setup

### Prerequisites

- Docker and Docker Compose installed
- Sufficient permissions to create and manage volumes

### Quick Start

```bash
# Navigate to the registry directory
cd cmd/registry

# Start the service
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the service
docker-compose down
```

### Building the Image

```bash
# Build the image
docker build -f Dockerfile -t capsule-registry .

# Run the container
docker run -d \
  --name capsule-registry \
  -p 8081:8080 \
  -v ./data:/app/data \
  -v ./logs:/app/logs \
  -v ./capsules:/app/capsules \
  capsule-registry
```

## Configuration

### Environment Variables

You can configure the service using environment variables in the `docker-compose.yml` file:

```yaml
environment:
  - DATABASE_HOST=postgres
  - DATABASE_PORT=5432
  - DATABASE_NAME=capsule_registry
  - DATABASE_USERNAME=postgres
  - DATABASE_PASSWORD=password
```

### Volumes

- `./data`: Application data
- `./logs`: Application logs
- `./capsules`: Capsule storage

## Security

The service runs as a non-root user for better security. No privileged mode is required.

## Health Check

The service includes a health check that verifies the HTTP endpoint is responding:
- **Interval**: 30 seconds
- **Timeout**: 3 seconds
- **Retries**: 3 attempts
- **Start Period**: 5 seconds

## Port Configuration

The service runs on port 8080 inside the container but is mapped to port 8081 on the host to avoid conflicts with the agent service.

## Troubleshooting

### Common Issues

1. **Port Already in Use**: Change the port mapping in docker-compose.yml
2. **Build Failures**: Ensure all dependencies are available
3. **Permission Issues**: Ensure the data and logs directories are writable

### Logs

```bash
# View logs
docker-compose logs -f

# View specific service logs
docker-compose logs -f capsule-registry
```

### Debugging

```bash
# Enter the container
docker-compose exec capsule-registry sh

# Check container status
docker-compose ps
```

## Data Management

### Backup

```bash
# Backup data directory
tar -czf registry-backup-$(date +%Y%m%d).tar.gz data/

# Backup capsules directory
tar -czf capsules-backup-$(date +%Y%m%d).tar.gz capsules/
```

### Restore

```bash
# Restore data
tar -xzf registry-backup-YYYYMMDD.tar.gz

# Restore capsules
tar -xzf capsules-backup-YYYYMMDD.tar.gz
``` 