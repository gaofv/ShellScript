#!/usr/bin/env bash

echo "��װJava"
echo " ����������������������������������������"
echo "| author��gaofv      |"
echo " ����������������������������������������"


sleep 3

echo "��ѹJava��Home�µ�JavaĿ¼"

rm -rf /home/java/*

mkdir /home/java

tar -zxvf /opt/install/jdk-8u181-linux-x64.tar.gz -C /home/java


echo "��ѹ���"

sleep 3

echo "��ʼ���û�������"

echo "��ע�⣺������������Ϊroot�û��Ļ�������"


echo "export JAVA_HOME=/home/java/jdk1.8.0_181" >> /root/.bash_profile

source /root/.bash_profile

echo "export PATH=$PATH:$JAVA_HOME/bin" >> /root/.bash_profile

source /root/.bash_profile

sleep 3

echo "�������"