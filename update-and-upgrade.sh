#! /bin/bash

# colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NOCOLOR='\033[0m' # No Color

# detet distro name
DISTRO=$(lsb_release -d | awk -F"\t" '{print $2}' | awk -F " " '{print $1}')

#distro lists
DEBIAN_BASED="Ubuntu Raspbian"
ARCH_BASED="Manjaro Arch"


#functions
#------------------------------------------------------------------------------
isIn() {
    [[ $2 =~ (^|[[:space:]])$1($|[[:space:]]) ]] && echo 1 || echo 0
}
#------------------------------------------------------------------------------


echo -e "${GREEN}--------------------------------------------${NOCOLOR}"
echo -e "            Your distro is ${GREEN}${DISTRO}${NOCOLOR}"
echo -e "${GREEN}--------------------------------------------${NOCOLOR}"

if [ $(isIn $DISTRO $ARCH_BASED) == 1 ]
then
    sudo pacman -Syu --noconfirm;
    sudo pacman -Rns $(pacman -Qdtq) --noconfirm;
    sudo pacman -Sc --noconfirm;

elif [ $(isIn $DISTRO $DEBIAN_BASED) == 1 ]
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
