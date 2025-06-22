# ─────────────────────────────────────────────────────────────
# Regular Dockerfile using a full Node.js image with OS tools
# This version includes everything in the final image (even build tools)
# ─────────────────────────────────────────────────────────────

#Use the official Node.js image with full OS capabilities
FROM node:18-alpine

#Set the working directory inside the container
WORKDIR /app

# Add npmrc to allow bypassing SSL verification
COPY .npmrc .npmrc

#Copy only package.json first to take advantage of Docker layer caching
COPY package.json .

#Install all dependencies listed in package.json
RUN npm install

#Copy the rest of the application code into the image
COPY . .

#Expose the application's default port to the host machine
EXPOSE 3002

#Set the default executable to npm
ENTRYPOINT ["npm"]

#Set the default command to run when the container starts
CMD ["start"]
