VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "2creatives-centos65-652"
  config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.2/centos65-x86_64-20131219.box"

  config.vm.hostname = "webserver"

  config.ssh.private_key_path = ["./files/insecure_private_key", "~/.ssh/vagrant-web-box"]

  config.vm.network :private_network, ip: "192.168.56.10"

  config.vm.synced_folder "./synced", "/synced"

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  # move your own key in
  id_rsa_ssh_key_pub = File.read(File.join(Dir.home, ".ssh", "vagrant-web-box.pub"))
  config.vm.provision :shell, :inline => "echo 'Copying local public key to vm...' && echo '#{id_rsa_ssh_key_pub }' > /home/vagrant/.ssh/authorized_keys"

  config.vm.provision :salt do |salt|
    salt.minion_config = "./files/minion"
    salt.run_highstate = true
    salt.verbose = true
  end

end

# time sudo salt-call state.highstate --local -l all 2>&1 | awk '{ print strftime("%Y-%m-%d %H:%M:%S"), $0; }'