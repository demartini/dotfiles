#!/bin/bash
set -euo pipefail

# Define color codes
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
RED="\033[0;31m"
RESET="\033[0m"

# Spinner function to show progress
spinner() {
  local pid=$!
  local delay=0.1
  local spinstr='\|/-'
  local spin_index=0

  while ps a | awk '{print $1}' | grep -q "$pid"; do
    printf "\r[%c]  " "${spinstr:spin_index:1}"
    ((spin_index = (spin_index + 1) % 4))
    sleep $delay
  done

  printf "\r[✔]  %s\n" "Done!"
}

# Function to check if a command exists, with optional install action
install_if_missing() {
  local name="$1"
  local check_command="$2"
  local install_command="$3"

  if ! command_exists "$check_command"; then
    echo -e "${CYAN}Installing ${name}...${RESET}"
    eval "$install_command" &
    spinner
    echo -e "${GREEN}${name} installation complete.${RESET}"
  else
    echo -e "${YELLOW}${name} is already installed.${RESET}"
  fi
}

# Helper function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Fisher is installed by verifying the existence of the files
install_if_fisher_missing() {
  if [[ ! -f "$HOME/.config/fish/functions/fisher.fish" || ! -f "$HOME/.config/fish/completions/fisher.fish" ]]; then
    echo -e "${CYAN}Installing Fisher...${RESET}"
    fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher' &
    spinner
    echo -e "${GREEN}Fisher installation complete.${RESET}"
  else
    echo -e "${YELLOW}Fisher is already installed.${RESET}"
  fi
}

# Welcome message and brief description
echo -e "${CYAN}Welcome to the Dotfiles Setup Script!${RESET}"
echo ""
echo "This script will ensure the following tools are installed and ready to use:"
echo -e "${GREEN}1. Xcode Command Line Tools${RESET} - Development tools for macOS."
echo -e "${GREEN}2. Homebrew${RESET} - Package manager for macOS and Linux."
echo -e "${GREEN}3. Fish Shell${RESET} - A user-friendly shell with powerful features."
echo -e "${GREEN}4. Fisher${RESET} - Plugin manager for Fish to enhance shell functionality."
echo -e "${GREEN}5. chezmoi${RESET} - Dotfiles manager for configuration management."
echo -e "${GREEN}6. age${RESET} - Secure file encryption tool."
echo ""
read -r -p "Would you like to proceed with the installation? (y/n): " choice

# Exit if the user does not agree
if [[ "$choice" != "y" ]]; then
  echo -e "${YELLOW}Exiting script. No changes have been made.${RESET}"
  exit 1
fi

# Install required tools with error handling
install_if_missing "Xcode Command Line Tools" "xcode-select" \
  "xcode-select --install || { echo -e \"${RED}Xcode Command Line Tools installation failed.${RESET}\"; exit 1; }"

install_if_missing "Homebrew" "brew" \
  "/bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\" || { echo -e \"${RED}Homebrew installation failed.${RESET}\"; exit 1; }"

install_if_missing "Fish Shell" "fish" \
  "brew install fish || { echo -e \"${RED}Fish Shell installation failed.${RESET}\"; exit 1; }"

install_if_fisher_missing

install_if_missing "chezmoi" "chezmoi" \
  "brew install chezmoi || { echo -e \"${RED}chezmoi installation failed.${RESET}\"; exit 1; }"

install_if_missing "age" "age" \
  "brew install age || { echo -e \"${RED}age installation failed.${RESET}\"; exit 1; }"

# Check if chezmoi has already been initialized
if [[ ! -d "$HOME/.local/share/chezmoi" ]]; then
  echo ""
  echo -e "${CYAN}chezmoi is not yet initialized.${RESET}"
  echo "To get started with chezmoi, you can initialize it by running:"
  echo -e "${GREEN}chezmoi init --apply <your-dotfiles-repo-url> -S ~/.dotfiles --ssh${RESET}"
else
  echo -e "${YELLOW}chezmoi has already been initialized.${RESET}"
fi

# Success message with summary
echo ""
echo -e "${GREEN}All required tools have been successfully installed and configured!${RESET}"
echo ""
echo "Installation Summary:"
echo -e "${GREEN}✓ Xcode Command Line Tools${RESET}"
echo -e "${GREEN}✓ Homebrew${RESET}"
echo -e "${GREEN}✓ Fish Shell${RESET}"
echo -e "${GREEN}✓ Fisher${RESET}"
echo -e "${GREEN}✓ chezmoi${RESET}"
echo -e "${GREEN}✓ age${RESET}"
echo ""
echo "You're ready to start managing your dotfiles with chezmoi. Happy coding!"
