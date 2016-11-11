virt-storage=default
default:
	if [ -d ".ssh" ]; then rm -r .ssh; fi
	mkdir .ssh
	ssh-keygen -t rsa -f .ssh/ssh-key -N ""
	sed -i "s/<STORAGE_NAME>/$(virt-storage)/g" Vagrantfile
