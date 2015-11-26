#!/usr/bin/env bash

debconf-set-selections <<< 'mysql-server mysql-server/root_password password rootpw'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password rootpw'

sudo apt-get update
sudo apt-get install -y python-dev ipython mysql-server mysql-client libmysqlclient-dev git vim emacs python-pip ruby-dev

pip install virtualenv

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
