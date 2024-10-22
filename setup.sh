#!/bin/bash

FillLine() {
    printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' =
}

PrintStep() {
    FillLine
    echo "$@"
    FillLine
}

HandleStepEnd() {
    FillLine
    read -r -p "press enter to continue: "
    clear
}

PrintStep "installing nix"

export NIX_BUILD_GROUP_ID=20000000
export NIX_FIRST_BUILD_UID=20000000

curl -L https://nixos.org/nix/install | sh -s -- --daemon

export PATH=/nix/var/nix/profiles/default/bin/:${HOME}/.nix-profile/bin/:$PATH
HandleStepEnd

PrintStep "installing home manager"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

sudo mkdir -p /etc/nix
echo -e "experimental-features = nix-command flakes" | sudo tee /etc/nix/nix.conf
HandleStepEnd

PrintStep "switching home-manager config"
home-manager --flake "${HOME}"/dotfiles/home-manager/ switch
HandleStepEnd

PrintStep "stowing nvim conf"
cd "${HOME}"/dotfiles || exit
export LC_ALL=C
stow nvim
HandleStepEnd





