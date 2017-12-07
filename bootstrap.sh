#!/usr/bin/env bash

set -e

# ugh...
if [ "$0" == "/setup.sh" ]; then
    # docker
    SUDO=""
else
    # vagrant
    SUDO="sudo"
fi

debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpw'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpw'

$SUDO apt-get update
$SUDO apt-get install -y python-dev ipython mysql-server mysql-client libmysqlclient-dev git vim emacs python-pip ruby-dev build-essential gdb devscripts automake dh-make dpkg-dev debhelper dh-autoreconf sgmltools-lite dpkg w3m po4a libdebconfclient0-dev    g++ bc lsb-release make gcc net-tools tmux iputils-ping iputils-arping iputils-tracepath tcpdump whois netcat dialog gnupg virtualenv python3-venv python3-dev wget curl

pip install virtualenv

# TODO git clone home

git config --global user.email "o.klischat@syseleven.de"
git config --global user.name "Olaf Klischat"

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

HH=/home/hosthome

if [ -d "$HH/utils" ]; then
    cd "$HH/utils"
    make  # TODO make it abort when interactive input (password entry) is required?
fi

if [ -d "$HH/.ssh" ]; then
    mkdir -p ~/.ssh
    find "$HH/.ssh/" -maxdepth 1 -type f ! -name authorized_keys -print0 | xargs -0 -i cp -f {} ~/.ssh/
fi
