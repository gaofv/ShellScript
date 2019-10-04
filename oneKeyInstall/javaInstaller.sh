#!/usr/bin/env bash

echo "安装Java"
echo " ————————————————————"
echo "| author：gaofv      |"
echo " ————————————————————"


sleep 3

echo "解压Java至Home下的Java目录"

rm -rf /home/java/*

mkdir /home/java

tar -zxvf /opt/install/jdk-8u181-linux-x64.tar.gz -C /home/java


echo "解压完成"

sleep 3

echo "开始配置环境变量"

echo "请注意：环境变量配置为root用户的环境变量"


echo "export JAVA_HOME=/home/java/jdk1.8.0_181" >> /root/.bash_profile

source /root/.bash_profile

echo "export PATH=$PATH:$JAVA_HOME/bin" >> /root/.bash_profile

source /root/.bash_profile

sleep 3

echo "配置完成"