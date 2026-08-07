#!/bin/bash
#
eth=$(cat /proc/net/dev | awk '{if($2>0 && NR > 2) print substr($1, 0, index($1, ":") - 1)}' | grep "^e[a-z,0-9].*")
ethurl=$"/etc/sysconfig/network-scripts/ifcfg-eth0"
sed -i 's/ONBOOT=[a-z]\{2\,3\}/ONBOOT=yes/' $ethurl
########################################################
sed -i '/BOOTPROTO=/d' $ethurl &> /dev/null
echo "BOOTPROTO=static" >> $ethurl
########################################################
sed -i '/IPADDR=*/d' $ethurl &> /dev/null
read -p "ipaddr=default_10.0.2.15: " ip
        if [ -z $ip ];then
        ip=10.0.2.15
        fi
echo "IPADDR=$ip" >> $ethurl && echo "IPADDR OK"
#######################################################
sed -i '/GATEWAY=*/d' $ethurl &> /dev/null
read -p "gateway=default_10.0.2.2: " ga
        if [ -z $ga ];then
         ga=10.0.2.2
        fi
echo "GATEWAY=$ga" >> $ethurl && echo "GATEWAY OK"
#######################################################
sed -i '/NETMASK=*/d' $ethurl &> /dev/null
read -p "netmask=default_255.255.255.0: " mask
        if [ -z $mask ];then
        mask=255.255.255.0
        fi
echo "NETMASK=$mask" >> $ethurl && echo "NETMASK OK"
#######################################################
sed -i '/DNS1=*/d' $ethurl &> /dev/null
read -p "dns1=default_223.5.5.5: " dns1
        if [ -z $dns2 ];then
        dns1=223.5.5.5
        fi
echo "DNS1=$dns1" >> $ethurl && echo "DNS1 OK"
#######################################################
sed -i '/DNS2=*/d' $ethurl &> /dev/null
read -p "dns2=default_8.8.8.8: " dns2
        if [ -z $dns2 ];then
        dns2=8.8.8.8
        fi
echo "DNS2=$dns2" >> $ethurl && echo "DNS2 OK"
#######################################################
systemctl restart network

