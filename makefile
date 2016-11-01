default:
	rm -r .ssh
	mkdir .ssh
	ssh-keygen -P teste -f .ssh/ssh-key -N ""
