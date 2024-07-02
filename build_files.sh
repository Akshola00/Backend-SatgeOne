#!/bin/bash

# Exit the script if any command fails
set -e

# Create and activate a virtual environment
python3.9 -m venv venv
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install the dependencies
pip install -r requirements.txt

# Collect static files
python3.9 manage.py collectstatic --noinput

# Create the output directory if it doesn't exist
mkdir -p staticfiles_build/static

# Move the collected static files to the output directory if they exist
if [ -d "static" ]; then
    mv static/* staticfiles_build/static/
else
    echo "No static files found in the 'static' directory."
fi
