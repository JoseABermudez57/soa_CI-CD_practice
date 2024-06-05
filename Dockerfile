# Use base
FROM node:20

# Copy the files of your project to the container
COPY . /app

# Stable the working directory
WORKDIR /app

# Install the project dependencies
RUN npm install

COPY . .

# Expose the port in which your application runs
EXPOSE 3000

# Define the command to start your application
CMD ["npm", "start"]