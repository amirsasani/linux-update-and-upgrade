#! /bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NOCOLOR='\033[0m' # No Color

DISTRO=$(lsb_release -d | awk -F"\t" '{print $2}' | awk -F " " '{print $1}')

echo -e "${GREEN}--------------------------------------------${NOCOLOR}"
echo -e "            Your distro is ${GREEN}${DISTRO}${NOCOLOR}"
echo -e "${GREEN}--------------------------------------------${NOCOLOR}"

if [ $DISTRO == 'Manjaro' ]
then
    sudo pacman -Syu --noconfirm;
    sudo pacman -Rns $(pacman -Qdtq) --noconfirm;
    sudo pacman -Sc --noconfirm;

elif [ $DISTRO == 'Ubuntu' ]
then
    sudo apt update -y;
    sudo apt upgrade -y;
    sudo apt autoremove -y;
    sudo apt autoclean -y;
else
    echo -e "${RED}NOT SUPPORTED!${NOCOLOR}\n"
    echo -e "Please contribute in github to make this command better and better :) don't forget to give it a ${YELLOW}STAR${NOCOLOR}\n"
    echo -e "${GREEN}https://github.com/amirsasani/linux-update-and-upgrade${NOCOLOR}"
fi
