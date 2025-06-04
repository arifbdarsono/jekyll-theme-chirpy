#!/bin/bash

# Development script for Jekyll Chirpy theme
# This script sets up the development environment and starts the Jekyll server

set -e

echo "🚀 Setting up development environment..."

# Check if bundle is installed
if ! command -v bundle &> /dev/null; then
    echo "❌ Bundler is not installed. Please install Ruby and Bundler first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install Node.js and npm first."
    exit 1
fi

echo "📦 Installing Ruby dependencies..."
bundle install

echo "📦 Installing Node.js dependencies..."
npm install

echo "🔨 Building assets..."
npm run build

echo "🌐 Starting Jekyll development server..."
echo "Your site will be available at: http://localhost:4000"
echo "Press Ctrl+C to stop the server"

bundle exec jekyll serve --host 0.0.0.0 --port 4000 --livereload