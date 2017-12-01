#!/bin/bash

sudo apt install -y python3-pip
pip3 install virtualenv
pip3 install --upgrade pip
virtualenv -p python3 ~/mypy3
echo "\nsource ~/mypy3/bin/activate" >> ~/.bashrc
echo "\nsource ~/mypy3/bin/activate" >> ~/.zshrc
