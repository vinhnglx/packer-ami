#!/bin/bash

# Dependencies install
sudo apt-get update && apt-get install -y build-essential

sudo apt-get install -y libpq-dev

sudo apt-get install -y libxml2-dev libxslt1-dev

sudo apt-get install -y libqt4-dev xvfb

sudo apt-get install -y libcurl4-openssl-dev

# ZSH
sudo apt-get install -y zsh

# Install Postgres
sudo apt-get install -y postgresql postgresql-contrib

# Node JS

sudo curl -sL https://deb.nodesource.com/setup_10.x | bash

sudo apt-get install -y nodejs

# RVM
sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -sSL https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh

rvm install 2.5

rvm use 2.5 --default

ruby -v

# Bundler
gem install Bundler

# Redis
sudo apt-get install -y redis-server

# Elixir and Phoenix
sudo apt-get install - erlang

wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb

sudo apt-get update

sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

# Erlang dependencies
sudo apt-get update
sudo apt-get install -y erlang-eunit
sudo apt-get install -y erlang-dev
sudo apt-get install -y erlang-edoc
sudo apt-get install -y erlang-parsetools

# Install Phoenix
mix archive.install hex phx_new 1.4.0 --force

# Install Nginx
sudo apt-get install -y nginx
sudo service nginx start