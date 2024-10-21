apt-get update
apt-get install iptables -y
apt-get install frr -y
systemctl enable --now ff
apt-get install tzdata -y
timedatectl set-timezone Europe/Moscow
hostnamectl set-hostname isp.au-team.irpo
exec bash
mkdir /etc/net/ifaces/enp6s{19,20}
cp enp6s18/options enp6s19/
cp enp6s18/options enp6s20/
echo -e "BOOTPROTO=static\nTYPE=eth" /etc/net/ifaces/enp6s19/options
echo -e "BOOTPROTO=static\nTYPE=eth" /etc/net/ifaces/enp6s20/options
touch /etc/net/ifaces/enp6s19/ipv4address
touch /etc/net/ifaces/enp6s20/ipv4address
echo net.ipv4.ip_forward = 1 >> /etc/sysctl.conf
cp /etc/net/sysctl.conf /etc/net/sysctl.conf.bak
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/net/sysctl.conf
systemctl restart network
sysctl -a | grep ip_forward
cp /etc/ffr/daemons /etc/frr/daemons.bak
sed -i 's/osfpd=no/osfpd=yes/g' /etc/frr/daemons
iptables -t nat -A POSTROUTING -o enp6s18 -j MASQUERADE
iptables-save > /etc/sysconfig/iptables
systemctl enable --now iptables
echo SUCCESSFULLY ISP CONFIGURATION BY ANDREONTHEBEST
echo sdelana copia net/sysctl.conf vot on ec 4ho net/sysctl.conf.bak
echo sdelana copia frr/daemons vot on ec 4ho frr/daemons.bak
echo postav ip dla enp6s19 u enp6s20
echo nastroy ospf dla ip enp6s19 u ip enp6s20
echo u nastroyka ISP bydet zavershena
echo END
