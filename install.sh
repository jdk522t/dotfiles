#!/bin/bash
#
# supported os
# Linux
# - Ubuntu / Debian
#

set -e
ROOT_PATH=$(pwd -P)

main() {
    # ask for password
    sudo echo "" > /dev/null
    package_manager_setup;

    # rust installation
}

info() {
    printf "\r  [ \033[0;34m..\033[0m ] $1\n\033[0m"
}

ok() {
    printf "\r\033[0m  [ \033[00;32mOK\033[0m ] $1\n"
}

err() {
    printf "\r\033[0m  [\033[0;31mERR\033[0m] $1\n"
    exit
}

package_manager_setup() {
    if [ -x "$(command -v apt)" ]; then
        info "Updating package manager";
        sudo apt update 1>/dev/null 2>/dev/null;
        ok "Update is success";
        info "Installing git & curl & zsh";
        sudo apt install -y git curl zsh 1>/dev/null 2>/dev/null;
        ok "Install success";
    else echo "${RED}ERROR: This linux distribution is not supported yet";
    fi
}

main
