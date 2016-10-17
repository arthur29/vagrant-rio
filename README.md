# vagrant-rio

##Pre-requisites
  1. Install nfs-server to syncronizing the swarm.
  2. Add nfs to sudo

	> Cmnd_Alias VAGRANT_EXPORTS_ADD = /usr/bin/tee -a /etc/exports
  > Cmnd_Alias VAGRANT_NFSD_CHECK = /usr/bin/systemctl status --no-pager nfs-server.service
  > Cmnd_Alias VAGRANT_NFSD_START = /usr/bin/systemctl start nfs-server.service
  > Cmnd_Alias VAGRANT_NFSD_APPLY = /usr/sbin/exportfs -ar
  > Cmnd_Alias VAGRANT_EXPORTS_REMOVE = /bin/sed -r -e * d -ibak /tmp/exports
  > %vagrant ALL=(root) NOPASSWD: VAGRANT_EXPORTS_ADD, VAGRANT_NFSD_CHECK, VAGRANT_NFSD_START, VAGRANT_NFSD_APPLY, VAGRANT_EXPORTS_REMOVE
