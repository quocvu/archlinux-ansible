#!/bin/bash

echo "==========================================="
echo "  Setting up your Archlinux PC             "
echo "==========================================="

sudo pacman -S ansible

install_dir="/tmp/setupmac-$RANDOM"
mkdir $install_dir

git clone https://github.com/quocvu/archlinux-ansible.git $install_dir
if [ ! -d $install_dir ]; then
    echo "git cloned failed"
    exit 1
else
    cd $install_dir
    ansible-galaxy install -r requirements.yml
    ansible-playbook -i ./hosts playbook.yml --verbose
fi

echo "Cleaning up. Remove repo..."
rm -Rfv /tmp/$install_dir

echo "All done!"
exit 0
