# Use an official Node.js runtime as a base image
FROM node:20

# Set the working directory in the container (This is where the volume is mounted, the directory is made if it doesn't exist)
WORKDIR /app

# Copy the Backend directory contents into the container at /app
COPY ./Backend/ /app

# Install any needed packages specified in the package.json
RUN npm install

# arguements 
ARG BACKEND_PORT
ARG CORS_ORIGIN
ARG FRONTEND_PORT

#Echo the arguements
RUN echo "BACKEND_PORT=${BACKEND_PORT}"
RUN echo "CORS_ORIGIN=${CORS_ORIGIN}"
RUN echo "FRONTEND_PORT=${FRONTEND_PORT}"


# ENVIRONMENT VARIABLES
ENV BACKEND_PORT=${BACKEND_PORT}
ENV CORS_ORIGIN=${CORS_ORIGIN}


# Run ls to see the contents of the directory
RUN ls

WORKDIR /app/Frontend

# Copy the Frontend directory contents into the container at /app/Frontend
COPY ./Frontend/ /app/Frontend

RUN npm install

#create a .env file in the Frontend directory
RUN echo "PORT=${FRONTEND_PORT}" >> .env \
    && echo "REACT_APP_BASE_URL=http://localhost:${BACKEND_PORT}" >> .env

# Run ls -la to see the contents of the directory
RUN ls -la

# cat the .env file to see the values
RUN cat .env

# Run npm run build in the Frontend directory
RUN npm run build

# COPY the build directory from the Frontend directory to the Backend directory
RUN cp -r /app/Frontend/build /app

# set the working directory to /app again
WORKDIR /app

# Delete the Frontend directory
RUN rm -rf /app/Frontend

# Expose the port the app runs in
EXPOSE ${BACKEND_PORT}

# Run the specified command within the container
CMD ["node", "src/index.js"]

