#!/bin/bash
#Switch between PHP versions

php-switch () {
  if brew ls --versions php@"$1" > /dev/null; then
    # The version of php is installed
    echo "Switching to PHP $1"
    brew unlink PHP
    brew link --force --overwrite php@"$1"
  else
    # Installing a new version of php
    echo "PHP $1 is not installed"
    echo "Installing PHP $1"
    brew install php@"$1"
    echo "Switching to PHP $1"
    brew unlink PHP
    brew link --force --overwrite php@"$1"
  fi
}
