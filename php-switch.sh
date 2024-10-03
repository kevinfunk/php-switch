#!/bin/bash
# Switch between PHP versions

php-switch () {
  if brew ls --versions php@"$1" > /dev/null; then
    # The version of PHP is installed
    echo "Switching to PHP $1"
    brew unlink php
    brew unlink php@"$1" # Ensure to unlink current version if already linked
    brew link --force --overwrite php@"$1"
  else
    # Installing a new version of PHP
    echo "PHP $1 is not installed"
    echo "Installing PHP $1"
    brew install php@"$1"
    echo "Switching to PHP $1"
    brew unlink php
    brew link --force --overwrite php@"$1"
  fi
}
