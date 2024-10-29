#!/bin/bash

# Ensure the current directory is a Git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Current directory is not a Git repository."
    exit 1
fi

# Ensure the working tree is clean
if ! git diff-index --quiet HEAD --; then
    echo "Error: Working tree is not clean. Please commit or stash your changes."
    exit 1
fi

# Checkout main branch
git checkout main || { echo "Failed to checkout the main branch."; exit 1; }

# Fetch upstream
git fetch upstream || { echo "Failed to fetch from upstream."; exit 1; }

# Rebase off of upstream/main
git rebase upstream/main || { echo "Rebase failed. Please resolve conflicts and then run the script again."; exit 1; }

# Push the changes
git push origin main || { echo "Failed to push changes to origin/main."; exit 1; }

echo "Rebase and push completed successfully."

