#!/usr/bin/env sh

set -e

# Install git
printf "\x1b[32m[+] Installing git\x1b[m\n\n"
sudo apt-get install git

# Create nest for all configurations
printf "\x1b[32x[+] Creating Repos directory\x1b[m\n\n"
mkdir "$HOME/Repos"

# Download configurations and playbooks
printf "\x1b[32m[+] Cloning configuration files\x1b[m\n\n"
git clone --recurse-submodules https://github.com/jonaylor89/dotfiles.git "$HOME/Repos/dotfiles"
git clone --recurse-submodules https://github.com/jonaylor89/bootstrap.git "$HOME/Repos/bootstrap"

# Install ansible to install everything
printf "\x1b[32mInstalling ansible\x1b[m\n\n"
sudo apt install ansible

# Put downloaded plays into default location
printf "\x1b[32m[+] Linking libraries\x1b[m\n\n"
ln -s "$HOME/Repos/dotfiles/ansible" "$HOME/.ansible"

# Execute Ubuntu playbook
printf "\x1b[32m[+] Executing plays\x1b[m\n\n"
ansible-playbook "$HOME/Repos/bootstrap/playbooks/ubuntu-desktop.yml" -K

