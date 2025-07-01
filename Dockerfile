# Use nodejs v20 alpine image
FROM node:20-alpine

# Switch to the app directory,
# This will be our app's root directory inside the container.
WORKDIR /app

# Copy the manifest and lock file to the root.
# Note: ./ refers to /app, since we switched context in the above step.
COPY package.json package-lock.json* ./

# Set the NODE_ENV to production.
# to configure the application to build/run under production mode
# this also tells npm to not install devDependencies mentioned in package.json
# as we won't be needing that to run our app
ENV NODE_ENV=production

# Install the production dependencies
RUN npm ci

# Copy all the files from our machine to the container
COPY . .

# The port you'd like to use for Nginx
ENV PORT=3500

# Expose the port the Nginx is running to the outside world
EXPOSE ${PORT}

# Start the node server
ENTRYPOINT ["node","./app.js"]
