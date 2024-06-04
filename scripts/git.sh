#!/bin/bash

# Function to check if Git is installed
check_git_installed() {
    if ! command -v git &> /dev/null; then
        return 1
    else
        return 0
    fi
}

# Function to install Git on Ubuntu
install_git_ubuntu() {
    if ! check_git_installed; then
        echo "Installing Git..."
        sudo apt update
        sudo apt install git -y
    else
        echo "Git is already installed."
    fi
}

# Function to install Git on Fedora
install_git_fedora() {
    if ! check_git_installed; then
        echo "Installing Git..."
        sudo dnf install git -y
    else
        echo "Git is already installed."
    fi
}

# Function to install Git on Arch Linux
install_git_arch() {
    if ! check_git_installed; then
        echo "Installing Git..."
        sudo pacman -Sy --noconfirm git
    else
        echo "Git is already installed."
    fi
}

# Function to check if GitHub CLI is installed
check_gh_installed() {
    if ! command -v gh &> /dev/null; then
        return 1
    else
        return 0
    fi
}

# Function to install GitHub CLI on Ubuntu
install_gh_ubuntu() {
    if ! check_gh_installed; then
        echo "Installing GitHub CLI..."
        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
        sudo apt-add-repository https://cli.github.com/packages
        sudo apt update
        sudo apt install gh -y
    else
        echo "GitHub CLI is already installed."
    fi
}

# Function to install GitHub CLI on Fedora
install_gh_fedora() {
    if ! check_gh_installed; then
        echo "Installing GitHub CLI..."
        sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
        sudo dnf install gh -y
    else
        echo "GitHub CLI is already installed."
    fi
}

# Function to install GitHub CLI on Arch Linux
install_gh_arch() {
    if ! check_gh_installed; then
        echo "Installing GitHub CLI..."
        sudo pacman -Sy --noconfirm github-cli
    else
        echo "GitHub CLI is already installed."
    fi
}

# Function to configure Git globally
configure_git() {
    echo "Configuring Git..."
    git config --global user.name "excreal1"
    git config --global user.email "148652451+excreal1@users.noreply.github.com"
    git config --global credential.helper store
}

# Main function
main() {
    if [[ -f /etc/os-release ]]; then
        . /etc/os-release
        case "$ID" in
            ubuntu)
                install_git_ubuntu
                install_gh_ubuntu
                ;;
            fedora)
                install_git_fedora
                install_gh_fedora
                ;;
            arch)
                install_git_arch
                install_gh_arch
                ;;
            *)
                echo "Unsupported distribution: $ID"
                exit 1
                ;;
        esac
        configure_git
    else
        echo "Cannot determine the distribution."
        exit 1
    fi
}

main
