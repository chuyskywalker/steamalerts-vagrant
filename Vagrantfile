VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #config.vm.box = "precise"
  #config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  #config.vm.box = "wheezy32"
  #config.vm.box_url = "http://tools.swergroup.com/downloads/wheezy32.box"

  #config.vm.box = "precise32"
  #config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  #config.vm.box = "puppet-labs-centos64"
  #config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210-nocm.box"

  #config.vm.box = "2creatives-centos64-641"
  #config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.4.1/centos64-x86_64-20131218.box"

  ######

  #config.vm.box = "2creatives-centos65-650"
  #config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.0/centos65-x86_64-20131202.box"

  #config.vm.box = "2creatives-centos65-651"
  #config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"

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