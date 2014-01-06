VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "2creatives-centos65-652"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.2/centos65-x86_64-20131219.box"

  config.vm.hostname = "webserver"

  config.vm.network :private_network, ip: "192.168.56.10"

  config.vm.synced_folder "./synced", "/synced"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  config.vm.provision :salt do |salt|
    salt.minion_config = "./files/minion"
    salt.run_highstate = true
  end

end

# time sudo salt-call state.highstate --local -l all 2>&1 | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; }'