#!/bin/bash

# Deploy a Django app and handle errors

# Function to clone the Django app code
code_clone() {
    echo "Cloning the Django app..."                                           
    if [ -d "django-notes-app" ]; then                                              
        echo "The code directory already exists. Skipping clone."               
    else                                                                            
        git clone https://github.com/LondheShubham153/django-notes-app.git || {                                                                                     
            echo "Failed to clone the code."                                            
            return 1                                                                
        }                                                                       
    fi                                                                     
}

# Function to install required dependencies
install_requirements() {                                                        
    echo "Installing dependencies..."                                           
    sudo apt-get update && sudo apt-get install -y docker.io nginx docker-compose || {
        echo "Failed to install dependencies."
        return 1
    }

    # Install Docker Buildx
    if ! docker buildx version &>/dev/null; then
        echo "Installing Docker Buildx..."
        mkdir -p ~/.docker/cli-plugins
        curl -fsSL https://github.com/docker/buildx/releases/latest/download/buildx-linux-amd64 -o ~/.docker/cli-plugins/docker-buildx
        chmod +x ~/.docker/cli-plugins/docker-buildx
    fi
}

# Function to perform required restarts
required_restarts() {
    echo "Performing required restarts..."
    sudo chown "$USER" /var/run/docker.sock || {
        echo "Failed to change ownership of docker.sock."
        return 1
    }

    # Uncomment if needed
    # sudo systemctl enable docker
    # sudo systemctl enable nginx
    sudo systemctl restart docker
    sudo systemctl restart nginx
}

# Function to deploy the Django app
deploy() {
    echo "Building and deploying the Django app..."
    
    # Check if Dockerfile exists
    if [ ! -f "Dockerfile" ]; then
        echo "Error: Dockerfile not found in the current directory."
        return 1
    fi

    docker build -t notes-app . && docker-compose up -d || {
        echo "Failed to build and deploy the app."
        return 1
    }
}

# Main deployment script
echo "********** DEPLOYMENT STARTED *********"

# Clone the code
if ! code_clone; then
    exit 1
fi

# Move into the cloned project directory
cd django-notes-app || exit 1

# Install dependencies
if ! install_requirements; then
    exit 1
fi

# Perform required restarts
if ! required_restarts; then
    exit 1
fi

# Deploy the app
if ! deploy; then
    echo "Deployment failed. Mailing the admin..."
    # Add your sendmail or notification logic here
    exit 1
fi

echo "********** DEPLOYMENT DONE *********"


