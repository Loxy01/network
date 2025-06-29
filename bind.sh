#!/bin/bash
apt-get update
apt-get install bind bind-utils -y
echo nameserver 127.0.0.1 > /etc/net/ifaces/enp6s18/resolv.conf
systemctl restart network
mv -f network/options.conf /etc/bind/options.conf
systemctl enable --now bind
mv -f network/au-team.irpo /etc/bind/zone/au-team.irpo
chown named:named /etc/bind/zone/au-team.irpo
mv -f network/rfc1912.conf /etc/bind/rfc1912.conf
systemctl restart bind
mv -f network/168.192.in-addr.arpa /etc/bind/zone/168.192.in-addr.arpa
chown named:named /etc/bind/zone/168.192.in-addr.arpa
systemctl restart bind
host 192.168.15.2 127.0.0.1
host 192.168.15.2 127.0.0.1
