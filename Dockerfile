# Use base
FROM node:20

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the project files
COPY . .

# Expose the port on which your application runs
EXPOSE 3000

# Define the command to start your application
CMD ["npm", "start"]
