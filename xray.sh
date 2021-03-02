
echo "开始安装git"
sudo apt install -y git
echo "git安装完成"
echo "=============================================================="
echo "开始部署nginx网站"
cd /usr/share/nginx/html
sudo rm -rf *
git clone https://github.com/SekiBetu/SekiBetu.github.io.git
cd SekiBetu.github.io
mv * ../
cd ..
sudo rm -rf SekiBetu.github.io
wget https://github.com/kmvan/x-prober/raw/master/dist/prober.php
sudo service php8.0-fpm restart
sudo service nginx restart
echo "部署完毕，当前目录文件如下"
echo "=============================================================="
ls -al
echo "主目录文件如下"
echo "=============================================================="
cd ..
ls -al
echo "=============================================================="
echo "清理xray多余文件"
cd /etc/v2ray-agent/xray
rm geoip.dat
rm geosite.dat
rm LICENSE
rm README.md
echo "清理完毕，当前目录文件如下"
echo "=============================================================="
ls -al
