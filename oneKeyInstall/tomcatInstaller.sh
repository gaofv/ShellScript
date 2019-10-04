#!/usr/bin/env bash


echo "安装Tomcat"
echo " ————————————————————"
echo "| author：gaofv      |"
echo " ————————————————————"

sleep 3

echo "开始安装tomcat"

sleep 3

rm -rf /home/tomcat

mkdir /home/tomcat


tar -zxvf /opt/install/apache-tomcat-8.5.37.tar.gz -C /home/tomcat


echo "开始配置环境变量"


echo "export TOMCAT_HOME=/home/tomcat/apache-tomcat-8.5.37" >> /root/.bash_profile

source /root/.bash_profile

echo "export PATH=$PATH:$TOMCAT_HOME/bin" >> /root/.bash_profile

source /root/.bash_profile

sleep 3

echo "配置完成"
