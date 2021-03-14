#!/bin/bash

cur_dir="$(pwd)"

echo "删除当前go版本，安装 go 1.16.2 版本"
sudo rm -rf $(go env GOROOT)
wget https://dl.google.com/go/go1.16.2.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.16.2.linux-amd64.tar.gz
sudo rm go1.16.2.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc
export PATH=$PATH:/usr/local/go/bin
echo "安装 git 7zip"
sudo apt install -y git
mkdir 7zip ; cd 7zip/
wget https://7-zip.org/a/7z2101-linux-x64.tar.xz ; 
sudo xz -d 7z2101-linux-x64.tar.xz ; sudo tar -xvf 7z2101-linux-x64.tar ; sudo mv 7zz /usr/bin/ ; cd .. ; sudo rm -rf 7zip/

cd ${cur_dir}
git clone https://github.com/SekiBetu/v2ray-core-4.27.5.git
cd v2ray-core-4.27.5/ || exit 2
sudo rm go.mod go.sum
go mod init v2ray.com/core
go mod tidy

echo "编译 v2ray-linux-64 中"
env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -ldflags "-s -w" -o v2ray-linux-64/v2ray ./main
env CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -v -ldflags "-s -w" -tags confonly -o v2ray-linux-64/v2ctl ./infra/control/main
echo "使用 7z 打包中"
7zz a ${cur_dir}/releases/v2ray-linux-64.7z v2ray v2ctl -mx=9 -r

echo "编译 v2ray-linux-arm64-v8a 中"
cd ${cur_dir}/v2ray-core-4.27.5/
env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -ldflags "-s -w" -o v2ray-linux-arm64-v8a/v2ray ./main
env CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -v -ldflags "-s -w" -tags confonly -o v2ray-linux-arm64-v8a/v2ctl ./infra/control/main
echo "使用 7z 打包中"
7zz a ${cur_dir}/releases/v2ray-linux-arm64-v8a.7z v2ray v2ctl -mx=9 -r

echo "编译 v2ray-macos-64 中"
cd ${cur_dir}/v2ray-core-4.27.5/
env CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -ldflags "-s -w" -o v2ray-macos-64/v2ray ./main
env CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -v -ldflags "-s -w" -tags confonly -o v2ray-macos-64/v2ctl ./infra/control/main
echo "使用 7z 打包中"
7zz a ${cur_dir}/releases/v2ray-macos-64.7z v2ray v2ctl -mx=9 -r

echo "编译 v2ray-macos-arm64 中"
cd ${cur_dir}/v2ray-core-4.27.5/
env CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -v -ldflags "-s -w" -o v2ray-macos-arm64-v8a/v2ray ./main
env CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -v -ldflags "-s -w" -tags confonly -o v2ray-macos-arm64-v8a/v2ctl ./infra/control/main
echo "使用 7z 打包中"
7zz a ${cur_dir}/releases/v2ray-macos-arm64-v8a.7z v2ray v2ctl -mx=9 -r

echo "编译 v2ray-windows-64 中"
cd ${cur_dir}/v2ray-core-4.27.5/
env CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o v2ray-windows-64/v2ray.exe -trimpath -ldflags "-s -w -buildid=" ./main
env CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o v2ray-windows-64/wv2ray.exe -trimpath -ldflags "-s -w -H windowsgui -buildid=" ./main
env CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o v2ray-windows-64/v2ctl.exe -trimpath -ldflags "-s -w -buildid=" -tags confonly ./infra/control/main
echo "使用 7z 打包中"
7zz a ${cur_dir}/releases/v2ray-windows-64.7z v2ray.exe wv2ray.exe v2ctl.exe -mx=9 -r

cd ${cur_dir}/v2ray-core-4.27.5/
echo "移动 go.mod go.sum 至 releases/"
mv go.mod ${cur_dir}/releases/
mv go.sum ${cur_dir}/releases/
cd ${cur_dir}
echo "清理垃圾"
sudo rm -rf v2ray-core-4.27.5/ go/