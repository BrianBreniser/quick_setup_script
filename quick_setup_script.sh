#!/bin/bash

# What OS is this? Just ask the user, it's easier
echo "***INFORM*** Checking Operating system..."
case $1 in
    "ubuntu")
        installer="sudo apt-get install "
        update="sudo apt-get update"
        ;;
    "arch")
        installer="sudo pacman -Syyu "
        archinstaller="yaourt -Syyu "
        update="sudo pacman -Syyu"
        ;;
    "osx")
        installer="brew install "
        update=""
        ;;
esac

echo "***INFORM*** Oh, we are on $1"
echo "Lets install some things..."
install_list=(
              fish
              htop
             )

# Installer section
for i in ${install_list[@]}
    do
        eval "$installer $i"
    done

arch_install_list=(
                   chrome
                   sublime-text
                  )

# Arch specific section
echo "***INFORM*** Specifically, are we on arch?"
if [ $1 = "arch" ]; then
    echo "***INFORM*** Yes we are on arch"
    echo "***INFORM*** installing some arch specific yaourt things now..."
    for i in ${arch_install_list[@]}
        do
            eval "$archinstaller $i"
        done
else echo "Nope, not on arch"
fi

done_installing="***INFORM*** done installing things"
eval "echo $done_installing" # yikes that's pretty ugly

