#! /usr/bin/env bash

log=$((docker swarm init --advertise-addr 192.168.12.2) 2>&1 1>/dev/null)
if [[ -z $log ]] ; then
   echo Initializing the cluster
else
   echo The cluster already exists
   echo $log
fi
swarm_init_command=$(docker swarm join-token manager)
cluster_token=$(echo $swarm_init_command | cut -d ' ' -f 17)
echo $cluster_token > /vagrant/cluster.token
cat /vagrant/ssh-key.pub >> /home/vagrant/.ssh/authorized_keys
chown vagrant:vagrant /vagrant/cluster.token
