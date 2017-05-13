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
              fish # fish shell because awesomeness
              htop # This isn't on some distrobutions for some reason, so usefull
             )

# Installer section
for i in ${install_list[@]}
    do
        eval "echo $installer $i" # AHHHHH INSTALL SECTION BE SO CAREFUL HERE I'M SERIOUS -----------------------------------------
    done

arch_install_list=(
                   chrome
                  )

# Arch specific section
echo "***INFORM*** Specifically, are we on arch?"
if [ $1 = "arch" ]; then
    echo "***INFORM*** Yes we are on arch"
    echo "***INFORM*** installing some arch specific yaourt things now..."
    for i in ${arch_install_list[@]}
        do
            eval "echo $archinstaller $i" # AHHHHH INSTALL SECTION BE SO CAREFUL HERE I'M SERIOUS ---------------------------------
        done
else echo "Nope, not on arch"
fi

# Some universal installer sections, not distrobution specific

universal_installer_commands=(
                              "echo curl https://sh.rustup.rs -sSf | sh" # yes yes yes I know how dangerous this is blah blah and it's automatic ahhh I know I'll take the risk
                             )
for i in "${universal_installer_commands[@]}"
    do
        eval $i # AHHHHH INSTALL SECTION BE SO CAREFUL HERE I'M SERIOUS -----------------------------------------
    done

done_installing="***INFORM*** done installing things"
eval "echo $done_installing" # yikes that's pretty ugly

