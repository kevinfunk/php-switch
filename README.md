# PHP Switch

A simple script to switch between PHP versions using Homebrew on macOS. This tool allows you to easily manage your PHP versions by checking if the desired version is installed and active.

## Requirements

- [Homebrew](https://brew.sh/): Ensure you have Homebrew installed on your system.

## How to Install

### Mac

1. **Clone the repository** to your applications directory:
   ```bash
   git clone git@github.com:kevinfunk/php-switch.git /Applications/php-switch
   ```

2. **Add the script to your shell profile** (`.zshrc`):
   ```bash
   echo "source /Applications/php-switch/php-switch.sh" | sudo tee -a ~/.zshrc >/dev/null
   ```

3. **Source your updated `.zshrc`**:
   ```bash
   source ~/.zshrc
   ```

## How to Use

To switch to a specific PHP version, run the command followed by the desired version number:

```bash
php-switch <version>
```

### Example

To switch to PHP version 8.1, use:

```bash
php-switch 8.1
```

### Features

- **Version Validation**: The script validates the PHP version input format (e.g., `7.4` or `8.1`).
- **Current Version Check**: The script checks if the desired PHP version is already active. If it is, the script will notify you and skip the switching process.
- **Automatic Installation**: If the requested version is not installed, the script will automatically install it using Homebrew.

## Troubleshooting

- If you encounter issues, ensure Homebrew is installed and updated:
  ```bash
  brew update
  ```

- Check the available PHP versions using:
  ```bash
  brew search php
  ```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

- [Kevin Funk](https://github.com/kevinfunk)
