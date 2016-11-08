# vagrant-rio

##Pre-requisites
  1. Install redhat-rpm-config rubygem-ruby-libvirt libvirt-devel libxslt-devel libxml2-devel ruby-devel vagrant-libvirt
  2. Install ruby-libvirt

  >  gem install ruby-libvirt -v '0.7.0'

  3. Install nokogiri

  > gem install nokogiri

  4. Install vagrant-libvirt plugin

  > vagrant plugin install vagrant-libvirt

  5. Run make to prepare the enviroment
  
###NFS still not implemented

  Add nfs to sudo in the sudoers file

  > Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports

  > Cmnd_Alias VAGRANT_NFSD_CHECK = /usr/bin/systemctl status --no-pager nfs-server.service

  > Cmnd_Alias VAGRANT_NFSD_START = /usr/bin/systemctl start nfs-server.service

  > Cmnd_Alias VAGRANT_NFSD_APPLY = /usr/sbin/exportfs -ar

  > Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /bin/sed -r -e * d -ibak /tmp/exports

  > %vagrant ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD_CHECK, VAGRANT_NFSD_START, VAGRANT_NFSD_APPLY, VAGRANT_EXPORTS_REMOVE

###Start other machines

  macae-worker and campos-worker do not start with "vagrant up" so if your machine have potential initialize it.
  To start them type:

  > vagrant up macae-worker

  > vagrant up campos-worker 

### BUG

I couldn't do an network on virt without DHCP, so I created a big sub network to decrease the probabily of ip coincidence.
