#!/bin/bash

VERSION=001
ZIP_PATH="./versions/python_v$VERSION.zip"

function prompt_confirm() {
    while true; do
        read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY;
        case $REPLY in
            [yY]) echo ; return 0 ;;
            [nN]) echo ; return 1 ;;
            *) printf " \033[31m %s  \n\033[0m" "invalid input";
        esac
    done
}

if [ -f $ZIP_PATH ]; then
    if ! prompt_confirm "Version $VERSION already exists. Overwrite?"; then
        echo "Please modify the version number and try again";
        exit 1;
    fi
fi

zip $ZIP_PATH main.py Bot/ Bot/board.py Bot/bot.py Bot/game.py Bot/__init__.py Bot/player.py


