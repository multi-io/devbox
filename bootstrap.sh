#!/usr/bin/env bash

debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpw'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpw'

sudo apt-get update
sudo apt-get install -y python-dev ipython mysql-server mysql-client libmysqlclient-dev git vim emacs python-pip ruby-dev build-essential gdb devscripts automake dh-make dpkg-dev debhelper dh-autoreconf sgmltools-lite dpkg w3m po4a libdebconfclient0-dev

pip install virtualenv

# TODO git clone home

git config --global user.email "o.klischat@syseleven.de"
git config --global user.name "Olaf Klischat"

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

HH=/home/hostolaf

if [ -d "$HH/utils" ]; then
    cd "$HH/utils"
    make  # TODO make it abort when interactive input (password entry) is required?
fi
