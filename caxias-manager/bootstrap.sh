#! /usr/bin/env bash

log=$((docker swarm init --advertise-addr 192.168.121.2:2377 --listen-addr 192.168.121.2:2377 --force-new-cluster) 2>&1 1>/dev/null)
if [[ -z $log ]] ; then
   echo Initializing the cluster
else
   echo The cluster already exists
   echo $log
fi
swarm_init_command=$(docker swarm join-token worker)
cluster_token=$(echo $swarm_init_command | cut -d ' ' -f 17)
echo $cluster_token > /vagrant/cluster.token
cat /vagrant/ssh-key.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /vagrant/cluster.token
