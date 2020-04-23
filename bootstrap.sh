#!/usr/bin/env bash

set -ex

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
$SUDO apt-get install -y mysql-server mysql-client libmysqlclient-dev git vim emacs python3-pip ruby-dev build-essential gdb devscripts automake dh-make dpkg-dev debhelper dh-autoreconf dpkg w3m po4a libdebconfclient0-dev    g++ bc lsb-release make gcc net-tools tmux iputils-ping iputils-arping iputils-tracepath tcpdump whois netcat dialog gnupg virtualenv python3-venv python3-dev wget curl dnsutils

pip install virtualenv

$SUDO curl -L https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl
$SUDO chmod +x /usr/local/bin/kubectl

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
