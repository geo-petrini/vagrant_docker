# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  #https://vagrantcloud.com/search.
  BOX_IMAGE 		= "ubuntu/jammy64"
  # BOX_IMAGE 		= "bento/ubuntu-24.04"
  # BOX_VERSION		= "202407.23.0"
  VM_NAME       	= "docker"
  BOX_CHK_UPDATE 	= false
  SSH_INSERT_KEY 	= false
  BASE_HOST_ONLY_NETWORK = "192.168.56"
  
  PROXY_ENABLE		= false
  #PROXY_HTTP		= "http://10.0.2.3:5865"
  #PROXY_HTTPS		= "http://10.0.2.3:5865"  
  PROXY_HTTP		= "http://10.20.0.1:8080"	#proxy.cpt.local
  PROXY_HTTPS		= "http://10.20.0.1:8080"	#proxy.cpt.local
  NO_PROXY 	= "localhost,127.0.0.1"
  
  VB_CHK_UPDATE	= false
  
  config.ssh.insert_key = SSH_INSERT_KEY
  if PROXY_ENABLE == true
    config.vagrant.plugins = "vagrant-proxyconf"
	if not Vagrant.has_plugin?("vagrant-proxyconf")
	  config.vm.post_up_message = "Proxy config plugin not present"
	end	
  end

  config.vm.box = BOX_IMAGE
  # config.vm.box_version = BOX_VERSION
  config.vm.hostname = VM_NAME
  config.vm.provider "virtualbox" do |vb|
    vb.name = VM_NAME
    vb.memory = "2048"
  end    

  #network configuration
  if PROXY_ENABLE == true
    # webconfig.vm.post_up_message = "setting proxy config"
    config.proxy.http = PROXY_HTTP
    config.proxy.https = PROXY_HTTPS
    config.proxy.no_proxy = NO_PROXY 
  end  
  config.vm.network "private_network", ip: "#{BASE_HOST_ONLY_NETWORK}.10"

  config.vm.provision "shell", path: "scripts/docker-install.sh"    
  config.vm.provision "shell", path: "scripts/portainer-install.sh"    
end
