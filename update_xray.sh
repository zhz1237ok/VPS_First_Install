#!/bin/bash

cur_dir="$(pwd)"

echo "删除当前go版本，安装 go 1.16.2 版本"
sudo rm -rf $(go env GOROOT)
wget https://dl.google.com/go/go1.16.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.16.2.linux-amd64.tar.gz
sudo rm go1.16.2.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc
export PATH=$PATH:/usr/local/go/bin
echo "安装 git"
sudo apt install -y git

git clone https://github.com/XTLS/Xray-core.git
cd Xray-core/ || exit 2
sudo rm go.mod go.sum
go mod init github.com/xtls/xray-core
go mod tidy
go get github.com/ghodss/yaml@master

echo "编译 xray-linux-64 中"
env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -ldflags "-s -w" -o xray ./main
sudo rm /etc/v2ray-agent/xray/xray
sudo mv xray /etc/v2ray-agent/xray/
sudo chmod 655 /etc/v2ray-agent/xray/xray

cd ${cur_dir}
echo "清理垃圾"
sudo rm -rf Xray-core/ go/
