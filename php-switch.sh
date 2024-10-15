#!/bin/bash
# Switch between PHP versions using Homebrew

php-switch () {
  # Check if Homebrew is installed
  if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Please install Homebrew first."
    return 1
  fi

  # Check if a version argument is provided
  if [[ -z "$1" ]]; then
    echo "Error: No PHP version provided."
    echo "Please provide a valid numeric PHP version, e.g., 7.4 or 8.1."
    return 1
  fi

  # Validate PHP version input
  if [[ ! "$1" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Invalid PHP version '$1'."
    echo "Please provide a valid numeric PHP version, e.g., 7.4 or 8.1."
    return 1
  fi

  # Get the currently active PHP version
  current_version=$(php -v | head -n 1 | awk '{print $2}' | cut -d '.' -f 1,2)

  # Check if the current version is already the desired version
  if [[ "$current_version" == "$1" ]]; then
    echo "You are already using PHP $1."
    return 0
  fi

  # Check if the desired PHP version is installed
  if brew ls --versions php@"$1" > /dev/null; then
    echo "Switching to PHP $1"
    brew unlink php
    # Unlink any existing links for this version
    brew unlink php@"$1"
    brew link --force --overwrite php@"$1"
  else
    # Install the new version if not already installed
    echo "PHP $1 is not installed. Installing PHP $1..."
    brew install php@"$1"
    echo "Switching to PHP $1"
    brew unlink php
    brew link --force --overwrite php@"$1"
  fi

  # Confirm the new version
  echo "PHP version is now $(php -v | head -n 1 | awk '{print $2}')"
}
