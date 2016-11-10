#! /usr/bin/env bash

cd /vagrant/macae-worker

echo Creating user operador
useradd -G wheel operador
passwd -d operador
echo Operador created

mkdir -p /home/operador/.ssh
cat /vagrant/.ssh/ssh-key.pub >> /home/operador/.ssh/authorized_keys
chown -R operador:operador /home/operador/.ssh

cd ../

#chown vagrant:vagrant /vagrant/cluster.token
while ! ping -c1 192.168.121.2 &>/dev/null; do
  echo ping 192.168.121.2
done
while [ "echo $(echo quit | telnet 192.168.121.2 22 2>/dev/null | grep Connected)" = "" ] ; do
 sleep 10s
done
while !  (scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no  -i /vagrant/.ssh/ssh-key vagrant@192.168.121.2:/vagrant/cluster.token /vagrant/cluster.token &>/dev/null); do
 sleep 10s
done

cluster_token=$(<cluster.token)
log=$((docker swarm join --advertise-addr 192.168.121.3:2377 --listen-addr 192.168.121.3:2377 --token $cluster_token 192.168.121.2:2377) 2>&1 1>/dev/null)

if [[ -z $log ]] ; then
  echo Joining to the cluster
else
  echo Error when trying to join the cluster redo the cluster
fi


