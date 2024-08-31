#!/bin/bash

# Update and install dependencies
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm git curl zsh wget base-devel openssl

# install Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# install brave browser and others
yay -S --noconfirm brave-bin gimp discord steam lutris thunderbird variety

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install asdf
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
echo -e '\n. "$HOME/.asdf/asdf.sh"\n' >>~/.zshrc
source ~/.asdf/asdf.sh

# Install Node.js via nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
echo -e '\nexport NVM_DIR="$HOME/.nvm"\n[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"\n' >>~/.zshrc
source ~/.zshrc
nvm install --lts

# Install SDKMAN!
curl -s "https://get.sdkman.io" | bash
echo -e '\nexport SDKMAN_DIR="$HOME/.sdkman"\n[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"\n' >>~/.zshrc
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Install Cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y
echo -e '\n. "$HOME/.cargo/env"\n' >>~/.zshrc

# Install pnpm
curl -fsSL https://get.pnpm.io/install.sh | sh -
echo -e '\nexport PNPM_HOME="$HOME/.local/share/pnpm"\nexport PATH="$PNPM_HOME:$PATH"\n' >>~/.zshrc

# Install Android SDK and NDK
sudo pacman -S --noconfirm unzip
mkdir -p "$HOME/Android/Sdk"
wget https://dl.google.com/android/repository/commandlinetools-linux-8512546_latest.zip -O cmdline-tools.zip
unzip cmdline-tools.zip -d "$HOME/Android/Sdk"
rm cmdline-tools.zip

# Set environment variables
echo -e '\nexport ANDROID_HOME="$HOME/Android/Sdk"\nexport NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"\n' >>~/.zshrc

# Install opam
sudo pacman -S --noconfirm opam
opam init -y --bare
echo -e '\n[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null\n' >>~/.zshrc

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..

# tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Final source to apply changes
source ~/.zshrc
