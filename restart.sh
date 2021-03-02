
# 清理后台日志
echo "清理后台日志"
echo "=============================================================="
cat /dev/null > nohup.out
echo "清理完毕"
echo "=============================================================="

# 心跳服务
echo "开始部署心跳包服务"
echo "=============================================================="
screen -dmUS X
echo "创建screen"
screen -x -S X -p 0 -X stuff "cd bilibili-pcheartbeat"
screen -x -S X -p 0 -X stuff "\n"
echo "进入目录"
screen -x -S X -p 0 -X stuff "node app.js"
screen -x -S X -p 0 -X stuff "\n"
echo "服务启动"
echo "=============================================================="

# B站脚本
echo "开始部署BiliHelper服务"
echo "=============================================================="
screen -dmUS B1
echo "创建用户1的screen"
screen -x -S B1 -p 0 -X stuff "cd BiliHelper-personal"
screen -x -S B1 -p 0 -X stuff "\n"
echo "进入目录"
screen -x -S B1 -p 0 -X stuff "php7.4 index.php user1.conf"
screen -x -S B1 -p 0 -X stuff "\n"
echo "用户1部署完毕"

screen -dmUS B2
echo "创建用户2的screen"
screen -x -S B2 -p 0 -X stuff "cd BiliHelper-personal"
screen -x -S B2 -p 0 -X stuff "\n"
echo "进入目录"
screen -x -S B2 -p 0 -X stuff "php7.4 index.php user2.conf"
screen -x -S B2 -p 0 -X stuff "\n"
echo "用户2部署完毕"
echo "=============================================================="

# 录制脚本
echo "开始部署录播脚本"
echo "=============================================================="
screen -dmUS L
echo "创建screen"
screen -x -S L -p 0 -X stuff "nohup record/record.sh twitcastpy 8ra195 best loop 10,10,1 record_video/8ra195 baidupan3 &"
screen -x -S L -p 0 -X stuff "\n"
screen -x -S L -p 0 -X stuff "\n"
echo "みけねこ"
screen -x -S L -p 0 -X stuff "nohup record/record.sh twitcastpy miso_ssw best loop 10,10,1 record_video/miso_ssw baidupan3 &"
screen -x -S L -p 0 -X stuff "\n"
screen -x -S L -p 0 -X stuff "\n"
echo "miso"
screen -x -S L -p 0 -X stuff "nohup record/record.sh twitcastpy masimasi0 best loop 10,10,1 record_video/masimasi0 baidupan3 &"
screen -x -S L -p 0 -X stuff "\n"
screen -x -S L -p 0 -X stuff "\n"
echo "佐藤希TC"
screen -x -S L -p 0 -X stuff "nohup record/record.sh youtube UCmrOHKPhWV1epCbTObd3eaQ best loop 10,10,1 record_video/satonozomi baidupan3 &"
screen -x -S L -p 0 -X stuff "\n"
screen -x -S L -p 0 -X stuff "\n"
echo "佐藤希Youtube"
screen -x -S L -p 0 -X stuff "nohup record/record.sh twitcastpy ai_mukaiav best loop 10,10,1 record_video/ai_mukaiav baidupan3 &"
screen -x -S L -p 0 -X stuff "\n"
screen -x -S L -p 0 -X stuff "\n"
echo "向井藍"
screen -x -S L -p 0 -X stuff "clear"
screen -x -S L -p 0 -X stuff "\n"
echo "清屏"
screen -x -S L -p 0 -X stuff "jobs"
screen -x -S L -p 0 -X stuff "\n"
echo "显示现存脚本"
echo "=============================================================="

# ASF
echo "开始部署ASF服务"
echo "=============================================================="
screen -dmUS ASF
echo "创建screen"
screen -x -S ASF -p 0 -X stuff "cd ASF"
screen -x -S ASF -p 0 -X stuff "\n"
echo "进入目录"
screen -x -S ASF -p 0 -X stuff "./ArchiSteamFarm"
screen -x -S ASF -p 0 -X stuff "\n"
echo "启动ASF"
echo "请手动输入 screen -U -r ASF 进入ASF填写Steam验证码"
