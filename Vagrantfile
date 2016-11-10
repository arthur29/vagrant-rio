# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "centos/7"

  #Install docker and enable it
  config.vm.provision :shell, path: "bootstrap.sh" 

  #Virt config
  config.vm.provider :libvirt do |libvirt|
     libvirt.storage_pool_name = "<STORAGE_NAME>"
     libvirt.memory = 1024
     libvirt.cpus = 1
     libvirt.storage :file, :size => '10G', :format => 'qcow2'

     libvirt.management_network_name = "cluster"
     libvirt.management_network_address = "192.168.0.0/16"
     libvirt.management_network_mode = "nat"

 end

  #caxias-manager configs
  config.vm.define "caxias-manager", primary: true do |caxias_manager|

      #Setting hostname
      caxias_manager.vm.hostname = "caxias-manager"

      #Network configing
      #NOTE: the network-config.sh is necessary because the vagrant not setting the ip to centos
      #      in the future this will be removed
      caxias_manager.vm.network :private_network, :libvirt__network_name => "cluster" 
      caxias_manager.vm.provision :shell, path: "caxias-manager/network-config.sh"


      #VM configing
      caxias_manager.vm.provision :shell, path: "caxias-manager/bootstrap.sh"

   end

   #macae-worker configs
   config.vm.define "macae-worker", autostart: false do |macae_worker|

      #Setting hostname
      macae_worker.vm.hostname = "macae-worker"

      #Network configing
      #NOTE: the network-config.sh is necessary because the vagrant not setting the ip to centos
      #      in the future this will be removed
      macae_worker.vm.network :private_network, :libvirt__network_name => "cluster" 
      macae_worker.vm.provision :shell, path: "macae-worker/network-config.sh"

      #VM configing
      macae_worker.vm.provision :shell, path: "macae-worker/bootstrap.sh"

   end

   #campos-worker configs
   config.vm.define "campos-worker", autostart: false do |campos_worker|

      #Setting hostname
      campos_worker.vm.hostname = "campos-worker"

      #Network configing
      #NOTE: the network-config.sh is necessary because the vagrant not setting the ip to centos
      #      in the future this will be removed
      campos_worker.vm.network :private_network, :libvirt__network_name => "cluster"
      campos_worker.vm.provision :shell, path: "campos-worker/network-config.sh"


      #VM configing
      campos_worker.vm.provision :shell, path: "campos-worker/bootstrap.sh"

   end

   #fundao-storage configs
   config.vm.define "fundao-storage" do |fundao_storage|

      #Setting hostname
      fundao_storage.vm.hostname = "fundao-storage"

      #Network configing
      #NOTE: the network-config.sh is necessary because the vagrant not setting the ip to centos
      #      in the future this will be removed
      fundao_storage.vm.network :private_network, :libvirt__network_name => "cluster"
      fundao_storage.vm.provision :shell, path: "fundao-storage/network-config.sh"


      #VM configing
      fundao_storage.vm.provision :shell, path: "fundao-storage/bootstrap.sh"

   end

  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
