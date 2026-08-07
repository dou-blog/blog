#!/bin/bash
#
cat >/etc/sysconfig/network-scripts/ifcfg-eth0<<EOF
BOOTPROTO=dhcp
IPV6INIT=yes
DEVICE=eth0
ONBOOT=yes
EOF
systemctl restart network
