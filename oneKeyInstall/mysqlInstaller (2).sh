#!/usr/bin/env bash

echo "��װMysql"
echo " ����������������������������������������"
echo "| author��GuoJiafeng |"
echo "| company��Baizhi    |"
echo " ����������������������������������������"

# wget -c http://mirrors.linuxeye.com/oneinstack-full.tar.gz && tar xzf oneinstack-full.tar.gz && ./oneinstack/install.sh --db_option 2 --dbinstallmethod 1 --dbrootpwd baizhi --reboot
echo "ж��ԭ��Mysql"
sleep 1

yum remove -y mysql*


echo "ֹͣMysql����"

service mysql stop

rpm -e --nodeps MySQL-client-5.5.62-1.el6.x86_64

rpm -e --nodeps MySQL-server-5.5.62-1.el6.x86_64

rpm -e --nodeps mysql-libs-5.1.73-8.el6_8.x86_64

echo "ɾ������ļ�"
rm -rf /var/lock/subsys/mysql
rm -rf /var/lib/mysql
rm -rf /var/lib/mysql/mysql
rm -rf /usr/lib64/mysql
rm -rf /usr/bin/mysql
rm -rf /usr/share/mysql
rm -rf /etc/rc.d/init.d/mysql
rm -rf /etc/logrotate.d/mysql
rm -rf /usr/share/mysql/*





echo "��װ�������� perl"
sleep 1
yum install perl


echo "��ʼ��װMysql �ͻ���"
sleep 1

rpm -ivh /root/app/MySQL-client-5.5.62-1.el6.x86_64.rpm

echo "��ʼ��װMysql �����"
sleep 1

rpm -ivh /root/app/MySQL-server-5.5.62-1.el6.x86_64.rpm

echo "ȷ���Ѿ��ر�mysqld_safe����"

mysqld_safepid=$( ps | grep mysqld_safe  |  awk '{print $1}')

kill -9 $mysqld_safepid

echo "����mysqld_safe����"
nohup mysqld_safe --skip-grant-table &

sleep 1

echo "mysql �Ѿ�����������ʼ�޸�����"
sleep 1

read -p "����������Ҫ�޸ĵ����룺"  mysqlpass01
read -p "������ENTER����"



mysql -f mysql -e "UPDATE user SET Password=PASSWORD('${mysqlpass01}') where USER='root'"

mysql  -e "flush privileges;"

echo "����Mysql"

service mysql restart


echo "Ĭ�Ͽ���Զ������Ȩ��"

mysql -uroot -p${mysqlpass01}  -e "use mysql;"

mysql -uroot -p${mysqlpass01}  -f mysql -e "delete from user where password='';"

mysql -uroot -p${mysqlpass01}  -f mysql -e "grant all privileges on *.* to 'root'@'%' identified by '$mysqlpass01' with grant option;"

mysql -uroot -p${mysqlpass01} -e "flush privileges;"

sleep 1

echo "����Mysql"

service mysql restart

echo "����mysqld_safe����"

mysqld_safepid=$( ps | grep mysqld_safe  |  awk '{print $1}')

kill -9 $mysqld_safepid


echo "��װ���"


echo "��������Ϊ:${mysqlpass01},���μǣ�"