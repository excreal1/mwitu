#!/bin/bash

# Check if there are changes to commit
if [ -n "$(git status --porcelain)" ]; then
    # Add all changes
    git add .

    # Prompt for commit message
    read -p "Enter commit message: " commit_message

    # Commit changes
    git commit -m "$commit_message"

    # Push changes to origin main
    git push origin main

    echo "Changes committed and pushed successfully."
else
    echo "No changes to commit."
fi
