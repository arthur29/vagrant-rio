cd /etc/sysconfig/network-scripts

echo DEVICE="eth1" > ifcfg-eth1
echo BOOTPROTO="static" >> ifcfg-eth1
echo ONBOOT="yes" >> ifcfg-eth1
echo GATEWAY=192.168.0.1 >> ifcfg-eth1
echo NETMASK=255.255.0.0 >> ifcfg-eth1
echo IPADDR=192.168.121.5 >> ifcfg-eth1
echo USERCTL=no >> ifcfg-eth1

systemctl restart network
