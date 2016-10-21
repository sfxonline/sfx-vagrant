# -*- mode: ruby -*-
# vi: set ft=ruby :
projectname = File.basename(Dir.getwd)

module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
    (/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
  end
end

Vagrant.configure("2") do |config|
  #config.ssh.insert_key = false
  config.ssh.forward_agent = true
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.network :private_network, ip: "33.33.33.10"
  config.vm.hostname = projectname

  #config.vm.synced_folder "./www", "/home/vagrant/www", create: true

  config.vm.provider "virtualbox" do |vb|
    vb.name = projectname
    vb.customize ["modifyvm", :id, "--cpus", 2]
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--memory", 2048]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
		vb.customize ["modifyvm", :id, "--paravirtprovider", "kvm"]
		vb.customize ["modifyvm", :id, "--pae", "on"]
    vb.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
    vb.customize ["modifyvm", :id, "--vram", 10]
  end

  config.vm.provider 'parallels' do |prl, override|
    prl.name = projectname
    prl.update_guest_tools = true
    prl.cpus = 2
    prl.memory = 2048
  end

  # bento images are not set to UTF-8
  config.vm.provision :shell, :inline => <<-EOT
    update-locale LANG=en_US.UTF-8
    update-locale LC_ALL="en_US.UTF-8
    update-locale LC_CTYPE="en_US.UTF-8
    EOT

  if OS.windows?
    config.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible/playbook.yml"
      ansible.inventory_path = "ansible-inventory"
      ansible.limit = "ansible_local"
    end
  else
    config.vm.provision "ansible" do |ansible|
      ansible.playbook = "ansible/playbook.yml"
      ansible.inventory_path = "ansible-inventory"
      ansible.limit = "vagrant"
    end
  end
end
