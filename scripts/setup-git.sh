# Read token from 1Password and authenticate
op read "op://dev/Github Access Token/credential" | gh auth login --with-token

# Set up Git with GitHub
gh auth setup-git

# Configure Git
git config --global user.name "Excreal"
git config --global user.email "148652451+excreal1@users.noreply.github.com"

# Verify authentication
gh auth status