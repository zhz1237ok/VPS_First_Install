
## Useful Path

```
/etc/sysctl.d/
```

```
/usr/share/nginx/html
```

```
/etc/nginx/conf.d/
```

```
/etc/php/8.0/fpm/pool.d/
```

```
/var/log/nginx/
```

## Useful Commands


```shell
apt install -y sudo
```

```
sudo timedatectl set-timezone Asia/Shanghai

sudo timedatectl set-ntp true
```

```shell
sudo apt update -y && sudo apt upgrade -y
```

```shell
sudo apt --purge autoremove -y
```

```shell
sudo apt remove -y vim-common
```

```shell
sudo apt install -y wget curl screen apt-transport-https dirmngr gnupg gnupg1 gnupg2 vim
```

```shell
vim /etc/ssh/sshd_config
```

```shell
kill -9 $(ps -ef | grep record | grep -v grep | awk '{print $2}')
```

```shell
cat /dev/null > nohup.out
```

```shell
ps aux|grep 
```

## Shell Scripts

#### 三网测速脚本：

```shell
bash <(curl -Lso- https://git.io/superspeed)
```

#### 一键DD脚本(默认密码cxthhhhh.com)：

https://www.cxthhhhh.com/Network-Reinstall-System-Modify

```shell
wget --no-check-certificate -qO ~/Network-Reinstall-System-Modify.sh 'https://www.cxthhhhh.com/CXT-Library/Network-Reinstall-System-Modify/Network-Reinstall-System-Modify.sh' && chmod a+x ~/Network-Reinstall-System-Modify.sh && bash ~/Network-Reinstall-System-Modify.sh -UI_Options
```

#### 安装xanmod内核相关指令

https://xanmod.org/

```shell
echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list
```

```shell
wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key --keyring /etc/apt/trusted.gpg.d/xanmod-kernel.gpg add -
```

```shell
sudo apt update -y && sudo apt upgrade -y && sudo apt install -y linux-xanmod-cacule
```

#### 卸载旧内核相关指令：

```shell
uname -a
```

```shell
dpkg --list | egrep -i --color 'linux-image|linux-headers'
```

```shell
sudo dpkg --purge --force-remove-essential linux-image-
```

#### BBR加速脚本(内含上述一键DD脚本)：

```shell
wget -N --no-check-certificate "https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh
```

#### 代理脚本(内含上述BBR加速脚本)：

```shell
wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
```

一键脚本外的一些改动
```json
"fallbacks": [
    {"alpn":"http/1.1","dest":31300},
    {"alpn":"h2","dest":31301}
    ]

"alpn": [
    "http/1.1",
    "h2"
    ],
```

#### 中转转发工具：

https://github.com/KANIKIG/Multi-EasyGost

https://github.com/Qv2ray/mmp-go

#### 自用初始化脚本：

```shell
curl https://raw.githubusercontent.com/SekiBetu/Linux/main/init.sh | bash
```

```shell
curl https://raw.githubusercontent.com/SekiBetu/Linux/main/restart.sh | bash
```

```shell
curl https://raw.githubusercontent.com/SekiBetu/Linux/main/build_v2ray.sh | bash
```

```shell
curl https://raw.githubusercontent.com/SekiBetu/Linux/main/xray.sh | bash
```

```shell
curl https://raw.githubusercontent.com/SekiBetu/Linux/main/build_xray.sh | bash
```

```shell
curl https://raw.githubusercontent.com/SekiBetu/Linux/main/update_xray.sh | bash
```

## 杂项

#### Go语言支持的TLS密码套件清单：

https://github.com/golang/go/blob/master/src/crypto/tls/cipher_suites.go#L474

#### debian源

https://debgen.simplylinux.ch/

`/etc/apt/sources.list`

```shell
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
wget https://nginx.org/keys/nginx_signing.key && apt-key add nginx_signing.key
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
wget -q -O- https://packages.sury.org/php/apt.gpg | apt-key add -
wget -nc https://dl.winehq.org/wine-builds/winehq.key && apt-key add winehq.key && rm winehq.key
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
```


#### PHP探针

```shell
sudo apt install -y php php-fpm
```

https://github.com/kmvan/x-prober

```shell
wget https://github.com/kmvan/x-prober/raw/master/dist/prober.php
```

nginx配置改动
```Nginx
server {
    listen 31301 http2;
    location ~ \.php$ {
        fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
        fastcgi_index prober.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
```

如果遇到
```shell
connect() to unix:/var/run/php/php8.0-fpm.sock failed (13: Permission denied) while connecting to upstream
```

就按以下步骤修改监听用户为nginx
```shell
vim /etc/php/8.0/fpm/pool.d/www.conf

; listen.owner = www-data
; listen.group = www-data
listen.owner = nginx
listen.group = nginx
```

## 相关链接

https://github.com/JustArchiNET/ArchiSteamFarm/releases/

https://www.python.org/downloads/

https://golang.org/dl/
