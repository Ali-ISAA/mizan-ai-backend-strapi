# mizan-ai-backend-strapi

# Strapi Docker Setup

This is a fully automated Strapi CMS setup with PostgreSQL database running in Docker containers.

## Prerequisites

- Docker
- Docker Compose

## Features

- **Automatic Strapi initialization** - No need to run create-strapi-app manually
- **PostgreSQL database** with persistent storage
- **Volume mapping** to local directories for easy development
- **Development mode** with hot-reload enabled

## Getting Started

### 1. Environment Configuration

Your `.env` file is already configured with secure secrets. The setup includes:

- Database: PostgreSQL
- Database credentials: strapi/strapi
- All required security tokens generated

### 2. Start Docker Containers

Simply run:

```bash
docker-compose up --build
```

Or run in detached mode:

```bash
docker-compose up -d --build
```

**What happens on first run:**
1. Docker builds the Strapi container
2. PostgreSQL container starts
3. Strapi automatically initializes a new project (using `create-strapi-app`)
4. Dependencies are installed
5. Admin panel is built
6. Strapi starts in development mode

This may take 5-10 minutes on first run.

### 3. Access Strapi

- **Strapi Admin:** http://localhost:5000/admin
- **Strapi API:** http://localhost:5000/api

On first access, you'll be prompted to create an admin user.

## Volume Mapping

All data is persisted to your local machine:

- **Strapi Application:** `./Volumes/app`
  - This contains your entire Strapi project
  - You can edit files here and changes will reflect in the container

- **PostgreSQL Data:** `./Volumes/postgres-data`
  - This contains your database files

## Useful Commands

**View logs:**
```bash
docker-compose logs -f strapi
```

**Stop containers:**
```bash
docker-compose down
```

**Stop and remove all data (WARNING - deletes everything!):**
```bash
docker-compose down
rmdir /s /q Volumes
```

**Restart containers:**
```bash
docker-compose restart
```

**Rebuild after changes:**
```bash
docker-compose up --build
```

**Access Strapi container shell:**
```bash
docker exec -it strapi sh
```

## Database Connection

- **Host (from container):** strapiDB
- **Host (from your machine):** localhost
- **Port:** 5432
- **Database:** strapi
- **Username:** strapi
- **Password:** strapi

## Development Workflow

1. Start containers: `docker-compose up`
2. Edit files in: `./Volumes/app`
3. Changes auto-reload in Strapi
4. Create content types via admin panel
5. Access your API at http://localhost:5000/api

## Troubleshooting

**Container won't start:**
- Check logs: `docker-compose logs strapi`
- Verify .env file has no syntax errors

**Port already in use:**
- Change ports in docker-compose.yml (5000:1337 or 5432:5432)

**Permission issues:**
- Ensure Docker has access to your project directory

**Database connection errors:**
- Ensure strapiDB container is running: `docker ps`
- Check database credentials in .env file

## Notes

- This setup is for **development only**
- For production, use different Dockerfile and secure credentials
- The entrypoint script automatically handles initialization
- Node modules are installed inside the container
