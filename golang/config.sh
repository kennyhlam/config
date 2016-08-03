#!/bin/bash

# setup go
cd ~/Downloads
wget https://storage.googleapis.com/golang/go1.4.1.linux-amd64.tar.gz
tar -xvzf go1.4.1.linux-amd64.tar.gz
sudo mv go /usr/local
mkdir ~/development/golang
mkdir ~/development/golang/bin
mkdir ~/development/golang/pkg
mkdir -p ~/development/golang/src/github.com/kennyhlam
