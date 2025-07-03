# Order Service

This is a simple Node.js microservice that provides a list of orders based on a user ID. It's designed to be containerized using Docker.
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

There is a Dockerfiles included:

### `Dockerfile`
This is the standard Dockerfile to build the Node.js app image. It includes steps like:
- Using `node` base image
- Copying source files
- Installing dependencies
- Setting the startup command


---

## 🚀 Build & Run Instructions

### Build the Docker Image
```bash
# Build & Run Commands
cd order-service
docker build -t order-service .
docker build -t [image_name] [path_to_directory_with_Dockerfile]
docker build → Builds a Docker image

-t [image_name] → Tags the image with a name (e.g., order-service)

. → Refers to the current directory (where the Dockerfile is located)

📌 Why use . (dot)?
The dot (.) tells Docker to look for the Dockerfile in the current directory.

Docker, by default, looks for a file named Dockerfile (case-sensitive: all lowercase, no extension) in that directory.
docker run -d -p 3002:3002 --name order-service-container order-service
docker run -d -p [host_port]:[container_port] --name [container_name] [image_name]


# Access URLs
curl localhost:3002
http://localhost:3002/ – Welcome message
http://localhost:3002/orders/1 – Orders for user ID 1

