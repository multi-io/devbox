#!/usr/bin/env bash

debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpw'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpw'

sudo apt-get update
sudo apt-get install -y python-dev ipython mysql-server mysql-client libmysqlclient-dev git vim emacs python-pip ruby-dev build-essential devscripts automake dh-make dpkg-dev debhelper dh-autoreconf sgmltools-lite dpkg w3m po4a libdebconfclient0-dev

pip install virtualenv

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
