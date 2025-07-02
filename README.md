# Order Service

This is a simple Node.js microservice that provides a list of orders based on a user ID. It's designed to be containerized using Docker and follows best practices such as multi-stage builds.

## 📦 Overview of Project Files

### `index.js`
This is the **entry point** of the application. It defines a basic HTTP server using Express (or native Node.js) that listens on port `3002` and serves two endpoints:
- `/` – returns a welcome message
- `/orders/:userId` – returns a list of dummy orders for the provided user ID

### `package.json`
This file contains the **metadata and dependencies** of the Node.js application, including:
- Project name and version
- Scripts for running the app (`start`, `dev`, etc.)
- Dependencies like `express`

### `.npmrc`
This is the **npm configuration file**. In this context, it might include custom npm registry URLs or settings such as:
- Skipping strict SSL
- Configuring default registry
- Setting up auth tokens (if needed)

This helps control how `npm install` behaves inside the Docker build.

---

## 🐳 Docker Support

There are two Dockerfiles included:

### `Dockerfile`
This is the standard Dockerfile to build the Node.js app image. It includes steps like:
- Using `node` base image
- Copying source files
- Installing dependencies
- Setting the startup command

### `Multi-stage-dockerfile`
This is a **production-grade Dockerfile** using multi-stage builds to optimize image size and security by:
- Separating build-time dependencies from runtime
- Creating a minimal final image

---

## 🚀 Build & Run Instructions

### Build the Docker Image
```bash
# Build & Run Commands
cd order-service
docker build -t order-service .
docker run -d -p 3002:3002 --name order-service-container order-service

# Access URLs
curl localhost:3002
http://localhost:3002/ – Welcome message
http://localhost:3002/orders/1 – Orders for user ID 1

