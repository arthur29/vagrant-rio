echo Creating user operador
useradd -G wheel operador
passwd -d operador
echo Operador created
mkdir -p /home/operador/.ssh
cat /vagrant/.ssh/ssh-key.pub >> /home/operador/.ssh/authorized_keys
chown -R operador:operador /home/operador/.ssh

