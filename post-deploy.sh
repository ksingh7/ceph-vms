#!/bin/bash
value=$( grep -ic "entry" /etc/hosts )
if [ $value -eq 0 ]
then
echo "
################ host entry ############

192.168.100.101 node1
192.168.100.102 node2
192.168.100.103 node3
192.168.100.106 rgw.homelab.com rgw
192.168.100.110 client1

######################################################
" >> /etc/hosts
fi
if [ -e /etc/redhat-release ]
then
systemctl stop ntpd
systemctl stop ntpdate
ntpdate 0.centos.pool.ntp.org > /dev/null 2> /dev/null
systemctl start ntpdate
systemctl start ntpd

        if [ -e /etc/rc.d/init.d/ceph ]
        then
        service ceph restart mon > /dev/null 2> /dev/null
        fi

fi
