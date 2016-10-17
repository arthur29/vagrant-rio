#! /usr/bin/env bash

yum update -y
cp /vagrant/docker.repo /etc/yum.repos.d/docker.repo 
yum install -y docker-engine
systemctl enable docker
systemctl start docker
usermod -aG docker vagrant
log=$((docker swarm init) 2>&1 1>/dev/null)
if [[ -z $log ]] ; then
   echo Initializing the cluster
else
   echo The cluster already exists
fi
swarm_init_command=$(docker swarm join-token manager)
cluster_token=$(echo $swarm_init_command | cut -d ' ' -f 17)
echo $cluster_token > /vagrant/cluster.token
chown vagrant:vagrant /vagrant/cluster.token
