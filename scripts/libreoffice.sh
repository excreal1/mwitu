#!/bin/bash

# Function to check if LibreOffice Writer is installed
check_libreoffice_installed() {
    if ! command -v libreoffice &> /dev/null; then
        return 1
    else
        return 0
    fi
}

# Function to set LibreOffice Writer as the default application for opening Word documents
set_libreoffice_default() {
    if ! check_libreoffice_installed; then
        echo "LibreOffice Writer is not installed. Please install LibreOffice first."
        exit 1
    else
        echo "Setting LibreOffice Writer as the default application for opening Word documents..."
        xdg-mime default libreoffice-writer.desktop application/msword
    fi
}

# Main function
main() {
    set_libreoffice_default
}

main
