#!/bin/bash

set -euv

# this file should run all the commands needed to setup the autograder
# In our case, this means ensure Ruby and Rubygems are installed and run `bundle`
# It's possible we may use a different Gemfile etc for Gradescope than for legacy grader

# Install all the dev tools
# apt-get update
apt-get install -y build-essential openssl curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison nodejs subversion # libreadline6 libreadline6-dev
gcc --version

# Source Option:
# Install Ruby 2.6 via source, because I couldn't get anything else to work.
apt-get install -y build-essential openssl curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison nodejs subversion # libreadline6 libreadline6-dev
curl https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.4.tar.gz -o ruby-2.6.4.tar.gz
gunzip ruby-2.6.4.tar.gz
tar -xvf ruby-2.6.4.tar
cd ruby-2.6.4
./configure
make
make install
ruby -v
cd ../
rm -r ruby-2.6.4

ls -R .
pwd

# Basic utils, if an assignment doesn't use a Gemfile
#gem install rspec # --no-rdoc --no-ri
gem install bundler # --no-rdoc --no-ri
gem install unf_ext -v '0.0.7.6' --source 'https://rubygems.org/'
bundle --version
#bundle install --gemfile=./source/Gemfile
#bundle exec --gemfile=./source/Gemfile rspec --version



# RVM Option:
# gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
# curl -sSL https://get.rvm.io | bash -s stable
# source ~/.rvm/scripts/rvm
# rvm install 2.6.3
# rvm use 2.6.3 --default
# ruby -v

# rbenv Option:
#git clone https://github.com/rbenv/rbenv.git ~/.rbenv
#/root/.rbenv/bin/rbenv init
#/root/.rbenv/rbenv install 2.4.0
#/root/.rbenv/rbenv global 2.4.0
