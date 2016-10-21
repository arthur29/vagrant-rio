# vagrant-rio

##Pre-requisites
  1. Install rubygem-ruby-libvirt libvirt-devel libxslt-devel libxml2-devel ruby-devel vagrant-libvirt
  2. Install ruby-libvirt

  >  gem install ruby-libvirt -v '0.7.0'

  3. Install nokogiri to

  > gem install nokogiri

  4. Create ssh key named ssh-key in the vagrant folder
  
###NFS still not implemented

  Add nfs to sudo

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
