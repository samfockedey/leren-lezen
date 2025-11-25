#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== GitHub Deployment Helper ===${NC}"

# 1. Initialize Git
if [ ! -d ".git" ]; then
    echo -e "${GREEN}Initializing Git repository...${NC}"
    git init
    git branch -M main
else
    echo -e "${GREEN}Git repository already initialized.${NC}"
fi

# 2. Add files
echo -e "${GREEN}Adding files...${NC}"
git add index.html README.md

# 3. Commit
echo -e "${GREEN}Committing changes...${NC}"
git commit -m "Initial commit: Leren Lezen app"

# 4. Remote URL
echo -e "${BLUE}---------------------------------------------------------${NC}"
echo -e "Please create a new repository on GitHub (https://github.com/new)"
echo -e "Do NOT add a README or .gitignore there (keep it empty)."
echo -e "${BLUE}---------------------------------------------------------${NC}"
read -p "Enter your new GitHub Repository URL (e.g., https://github.com/username/repo.git): " REMOTE_URL

if [ -z "$REMOTE_URL" ]; then
    echo "Error: No URL provided. Exiting."
    exit 1
fi

# 5. Add Remote and Push
echo -e "${GREEN}Adding remote origin...${NC}"
git remote remove origin 2>/dev/null # Remove if exists to be safe
git remote add origin "$REMOTE_URL"

echo -e "${GREEN}Pushing to GitHub...${NC}"
git push -u origin main

echo -e "${BLUE}---------------------------------------------------------${NC}"
echo -e "${GREEN}Success! Code pushed.${NC}"
echo -e "Now go to your repository settings on GitHub:"
echo -e "1. Click 'Settings' tab"
echo -e "2. Click 'Pages' in the left sidebar"
echo -e "3. Under 'Branch', select 'main' and click 'Save'"
echo -e "4. Wait a minute, and your site will be live!"
