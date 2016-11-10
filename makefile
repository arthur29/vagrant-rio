virt-storage=default
default:
	rm -r .ssh
	mkdir .ssh
	ssh-keygen -t rsa -f .ssh/ssh-key -N ""
	sed -i "s/<STORAGE_NAME>/$(virt-storage)/g" Vagrantfile
