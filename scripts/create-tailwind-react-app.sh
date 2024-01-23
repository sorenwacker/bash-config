#!/bin/bash

# Usage: ./create-tailwind-react-app.sh my-app
# Replace 'my-app' with your desired project name

PROJECT_NAME=$1

# Create a new React application
npx create-react-app $PROJECT_NAME

# Navigate into the project directory
cd $PROJECT_NAME

# Install Tailwind CSS and its dependencies
npm install tailwindcss postcss autoprefixer

# Install CRACO
npm install @craco/craco

# Generate Tailwind config and PostCSS config
npx tailwindcss init -p

# Replace the scripts in package.json with CRACO scripts
sed -i 's/"start": "react-scripts start"/"start": "craco start"/' package.json
sed -i 's/"build": "react-scripts build"/"build": "craco build"/' package.json
sed -i 's/"test": "react-scripts test"/"test": "craco test"/' package.json
sed -i 's/"eject": "react-scripts eject"/"eject": "craco eject"/' package.json

# Add Tailwind directives to src/index.css
echo '@tailwind base;' >> src/index.css
echo '@tailwind components;' >> src/index.css
echo '@tailwind utilities;' >> src/index.css

# Create a CRACO configuration file
echo "module.exports = {
  style: {
    postcss: {
      plugins: [
        require('tailwindcss'),
        require('autoprefixer'),
      ],
    },
  },
};" > craco.config.js

echo "Project $PROJECT_NAME created successfully!"

