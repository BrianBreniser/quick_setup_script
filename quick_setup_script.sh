#!/bin/bash
set -e # fail on anything erroring

# What OS is this? Just ask the user, it's easier
echo "***INFORM*** Checking Operating system..."
case $1 in
    "ubuntu")
        installer="sudo apt-get install "
        update="sudo apt-get update"
        ;;
    "arch")
        installer="sudo pacman -Syyu "
        archinstaller="yaourt -S "
        update="sudo pacman -Syyu"
        ;;
    "osx")
        installer="brew install "
        update=""
        ;;
esac

# to install cargo things if rust gets installed
cargo_install="cargo install "

echo "***INFORM*** Oh, we are on $1"
echo "Lets install some things..."
install_list=(
              fish # fish shell because awesomeness
              htop # This isn't on some distrobutions for some reason, so usefull
              ranger # awesome folder viewer
              thunar # xfce folder viewer, not bad for gui
              rofi # launcher
              vim # not always installed
              # nvim # nvim >> vim but will this actually install it?
              terminology # nice terminal emulator
              termite # also a good terminal emulator
              glances # like htop, built in python, quick view of system resources
              git # because reasons obviously
             )

# Installer section
for i in ${install_list[@]}
    do
        eval "echo $installer $i" # AHHHHH INSTALL SECTION BE SO CAREFUL HERE I'M SERIOUS -----------------------------------------
    done

arch_install_list=(
                   google-chrome
                   firefox-developer
                   visual-studio-code
                   vivaldi
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

# Rust specific things
echo "***INFORM*** installing some awesome rust things"
cargo_install_list=(
                   ripgrep
                   "fd-find"
                   exa
                  )

# Rust installer section
for i in ${cargo_install_list[@]}
    do
        eval "echo $cargo_install $i" # AHHHHH INSTALL SECTION BE SO CAREFUL HERE I'M SERIOUS -----------------------------------------
    done


done_installing="***INFORM*** done installing things"
eval "echo $done_installing" # yikes that's pretty ugly

### Some notes on things I don't know if I can automate ###
## Sublime text 3 packages
# anaconda_rust - for sublime racer/rls things
# colorsublime - Themes
# dateutil
# plaintasks
# pyyaml
# theme -e default
# sulimeCodeIntel
# backrefs
# markupsafe
# mdpopups
# pygments
# python-jinja2
# python-markdown
# pyyaml
# SublimeLinter


