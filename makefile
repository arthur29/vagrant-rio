virt-storage=default
default:
	rm -r .ssh
	mkdir .ssh
	ssh-keygen -P teste -f .ssh/ssh-key -N ""
	sed -i "s/<STORAGE_NAME>/$(virt-storage)/g" Vagrantfile
