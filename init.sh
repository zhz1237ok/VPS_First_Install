[[ -d livedl ]] || [[ -f livedl ]] && echo "请使用`sudo rm -rf livedl`指令删除livedl文件或文件夹后重试" && exit 1 # git clone需要空文件夹

echo "清理过时依赖"
echo "=============================================================="
sudo apt autoremove -y # 清理过时依赖
echo "=============================================================="
echo "卸载vim兼容vi模式"
echo "=============================================================="
sudo apt remove -y vim-common # 卸载vim兼容vi模式
echo "=============================================================="
echo "安装vim"
echo "=============================================================="
sudo apt install -y vim # 安装vim
echo "=============================================================="
echo "安装ffmpeg"
echo "=============================================================="
sudo apt install -y ffmpeg # 安装ffmpeg
echo "=============================================================="
echo "安装libunwind8 gettext"
echo "=============================================================="
sudo apt install -y libunwind8 gettext # 安装libunwind8 gettext
echo "=============================================================="
echo "安装Java"
echo "=============================================================="
sudo apt install -y default-jre # 安装Java
echo "=============================================================="
echo "安装unzip"
echo "=============================================================="
sudo apt install -y unzip # 安装unzip
echo "=============================================================="
echo "安装screen"
echo "=============================================================="
sudo apt install -y screen # 安装screen
echo "=============================================================="
echo "卸载目前的php"
echo "=============================================================="
sudo apt-get autoremove php*
sudo find /etc -name "*php*" |xargs  rm -rf 
sudo apt purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`
echo "=============================================================="
echo "安装php7.4"
echo "=============================================================="
sudo apt install -y php7.4 # 安装php7.4
echo "=============================================================="
echo "安装php7.4-curl"
echo "=============================================================="
sudo apt install -y php7.4-curl # 安装php7.4-curl
echo "=============================================================="
echo "安装php7.4-mbstring"
echo "=============================================================="
sudo apt install -y php7.4-mbstring # 安装php7.4-mbstring
echo "=============================================================="
echo "安装git"
echo "=============================================================="
sudo apt install -y git # 安装git
echo "=============================================================="
echo "#安装nodejs LTS"
echo "=============================================================="
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - # 安装nodejs LTS
sudo apt install -y nodejs
echo "=============================================================="
echo "将主机设置为Asia/Shanghai时区并通过systemd-timesyncd自动同步时间"
echo "=============================================================="
sudo timedatectl set-timezone Asia/Shanghai # 将主机设置为Asia/Shanghai时区
sudo timedatectl set-ntp true # 通过systemd-timesyncd自动同步时间
echo "=============================================================="


# 安装BiliHelper-personal
echo "安装BiliHelper-personal"
echo "=============================================================="
curl -sS https://getcomposer.org/installer | php7.4 # 安装composer
mv composer.phar /usr/local/bin/composer
git clone https://github.com/lkeme/BiliHelper-personal.git
git clone https://github.com/lkeme/bilibili-pcheartbeat.git
cd BiliHelper-personal/
composer update
composer install
cd ..
cd bilibili-pcheartbeat/
npm install -g npm
npm install
cd ..
echo "=============================================================="

# 编译安装python3相关下载工具
echo "编译安装python3相关下载工具"
echo "=============================================================="
bash <(curl -sL https://python3.netlify.app/install.sh) -v 3.7.10 # 安装python3.7.10
pip3 install streamlink ; pip3 install youtube-dl ; pip3 install you-get # 安装基于python3的下载工具
echo 'export PATH=$PATH:/usr/local/bin'>>~/.bashrc # 修改默认环境变量，如不希望可以注释掉
export PATH=$PATH:/usr/local/bin
echo "=============================================================="

# 安装go相关下载工具
echo "安装go相关下载工具"
echo "=============================================================="
sudo rm -rf /usr/local/go # 如果有已经安装的go环境，先卸载，新老版本会有冲突，如不希望可以注释掉
wget https://dl.google.com/go/go1.16.linux-amd64.tar.gz # 安装go环境，如不希望可以注释掉
sudo tar -C /usr/local -xzf go1.16.linux-amd64.tar.gz ; rm go1.16.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin'>>~/.bashrc # 修改默认环境变量，如不希望可以注释掉
export PATH=$PATH:/usr/local/go/bin
sudo apt -y install build-essential
echo "此处可能需要较长时间，请耐心等待"
git clone -b module https://github.com/nnn-revo2012/livedl.git ; cd livedl/src ; go build -o livedl livedl.go ; rm -r `ls | grep -v "^livedl$"` ; cd .. #编译安装livedl
echo "=============================================================="

# 安装B站录制相关工具
echo "安装B站录制相关工具"
echo "=============================================================="
mkdir -p BilibiliLiveRecorder
cd BilibiliLiveRecorder
wget https://github.com/nICEnnnnnnnLee/BilibiliLiveRecorder/releases/download/V2.13.0/BilibiliLiveRecord.v2.13.0.zip
unzip BilibiliLiveRecord.v2.13.0.zip
rm BilibiliLiveRecord.v2.13.0.zip
cd ..
echo "=============================================================="

# 下载脚本并赋予权限
echo "下载脚本并赋予权限"
echo "=============================================================="
mkdir -p record
wget -O "record/record.sh" "https://raw.githubusercontent.com/lovezzzxxx/liverecord/master/record.sh" ; chmod +x record/record.sh
wget -O "record/record_new.sh" "https://raw.githubusercontent.com/lovezzzxxx/liverecord/master/record_new.sh" ; chmod +x record/record_new.sh
wget -O "record/record_twitcast.py" "https://raw.githubusercontent.com/lovezzzxxx/liverecord/master/record_twitcast.py" ; chmod +x record/record_twitcast.py
echo "=============================================================="

# 配置自动上传
echo "配置自动上传"
echo "=============================================================="
# curl https://rclone.org/install.sh | bash # 配置rclone自动上传
# sudo wget https://raw.githubusercontent.com/MoeClub/OneList/master/OneDriveUploader/amd64/linux/OneDriveUploader -P /usr/local/bin/ # 配置onedrive自动上传
# sudo chmod +x /usr/local/bin/OneDriveUploader
go get github.com/qjfoidnh/BaiduPCS-Go # 配置百度云自动上传
echo 'export PATH=$PATH:'`echo ~`'/go/bin'>>~/.bashrc # 修改默认环境变量，如不希望可以注释掉
source ~/.bashrc
echo "=============================================================="

# 安装ASF
echo "安装ASF"
echo "=============================================================="
wget https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/5.0.3.2/ASF-linux-x64.zip
unzip ASF-linux-x64.zip -d ASF/
rm ASF-linux-x64.zip
cd ASF/
chmod +x ArchiSteamFarm
cd ..
echo "=============================================================="

# 再次清理过时依赖
echo "再次清理过时依赖"
echo "=============================================================="
sudo apt autoremove -y
echo "=============================================================="

# 提示登陆
echo '请手动运行`source ~/.bashrc`或者重新链接ssh更新环境变量使下列命令生效'
echo '使用`rclone config`登陆rclone'
echo '使用`OneDriveUploader -cn -a "打开https://github.com/MoeClub/OneList/tree/master/OneDriveUploader中的相应网页并登录后浏览器地址栏返回的url"`登陆rclone'
echo '使用`BaiduPCS-Go login -bduss="百度网盘网页cookie中bduss项的值"`登陆BaiduPCS-Go，'

