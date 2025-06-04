# Deployment Guide

This repository is configured for automatic deployment to Netlify using GitHub Actions.

## Setup Instructions

### 1. Netlify Setup

1. **Create a Netlify account** at [netlify.com](https://netlify.com)
2. **Create a new site** from Git:
   - Connect your GitHub account
   - Select this repository
   - Use the following build settings:
     - Build command: `npm install && npm run build && bundle install && JEKYLL_ENV=production bundle exec jekyll build`
     - Publish directory: `_site`
     - Node version: `20`
     - Ruby version: `3.3.0`

3. **Get your Netlify credentials**:
   - Go to User Settings → Applications → Personal access tokens
   - Generate a new access token and copy it
   - Go to your site settings and copy the Site ID (found in Site details)

### 2. GitHub Secrets Setup

Add the following secrets to your GitHub repository:

1. Go to your repository on GitHub
2. Navigate to Settings → Secrets and variables → Actions
3. Add the following repository secrets:
   - `NETLIFY_AUTH_TOKEN`: Your Netlify personal access token
   - `NETLIFY_SITE_ID`: Your Netlify site ID

### 3. Configuration

Update the `_config.yml` file with your site's information:

```yaml
# Update these fields
title: Your Site Title
tagline: Your site tagline
description: Your site description
url: "https://your-site-name.netlify.app"  # Your Netlify URL

github:
  username: your-github-username

social:
  name: Your Full Name
  email: your-email@domain.com
  links:
    - https://github.com/your-username
```

### 4. Deployment

Once everything is set up:

1. **Automatic deployment**: Push changes to the `master` branch, and GitHub Actions will automatically build and deploy your site to Netlify.

2. **Manual deployment**: You can also trigger a deployment manually from the GitHub Actions tab.

## Build Process

The deployment process includes:

1. **Asset building**: JavaScript and CSS assets are compiled and optimized
2. **Jekyll build**: The site is built with Jekyll in production mode
3. **Netlify deployment**: The built site is deployed to Netlify

## Customization

### Build Command
The build process is defined in `netlify.toml` and can be customized as needed.

### Environment Variables
You can add environment variables in Netlify's site settings if needed for your specific configuration.

### Domain Setup
To use a custom domain:
1. Go to your Netlify site settings
2. Navigate to Domain management
3. Add your custom domain
4. Update the `url` field in `_config.yml` to match your custom domain

## Troubleshooting

### Build Failures
- Check the GitHub Actions logs for detailed error messages
- Ensure all dependencies are properly listed in `Gemfile` and `package.json`
- Verify that your `_config.yml` is valid YAML

### Deployment Issues
- Verify that your Netlify secrets are correctly set in GitHub
- Check that your Netlify site ID and auth token are valid
- Ensure the publish directory is set to `_site`

## Local Development

To run the site locally:

```bash
# Install dependencies
bundle install
npm install

# Build assets
npm run build

# Serve the site
bundle exec jekyll serve
```

The site will be available at `http://localhost:4000`.