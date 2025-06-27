#!/bin/bash

# MkDocs development server script

echo "Starting MkDocs development server..."
echo "======================================="
echo ""
echo "First time setup? Run these commands:"
echo "  python3 -m venv venv"
echo "  source venv/bin/activate"
echo "  pip install -r requirements.txt"
echo ""
echo "Already set up? The server will start now."
echo ""

# Check if virtual environment exists
if [ -d "venv" ]; then
  source venv/bin/activate
  mkdocs serve
else
  echo "Virtual environment not found!"
  echo "Please run the setup commands listed above."
  exit 1
fi

