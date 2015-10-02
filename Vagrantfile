# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.ssh.forward_agent = true

    config.vm.box = "ubuntu/trusty32"

    config.vm.network :private_network, ip: "33.33.33.10"

    config.vm.hostname = "shopware5.dev"

    config.vm.synced_folder "./ansible", "/ansible"
    config.vm.synced_folder "../src", "/home/vagrant/www/shopware", create: true;

# UNIX only Lösung da Ansible und Python auf dem Host benötigt werden (gibt es für Windows derzeit nicht)
#    config.vm.provision "ansible" do |ansible|
#        ansible.playbook = "ansible/playbook.yml"
#        ansible.inventory_path = "ansible-inventory"
#    end

    config.vm.provider "virtualbox" do |vb|
        vb.name = "shopware5.dev"
        vb.customize ["modifyvm", :id, "--cpus", 2]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
        vb.customize ["modifyvm", :id, "--memory", 1024]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

    config.vm.provision :shell do |sh|
        sh.keep_color = true
        sh.privileged = false
        sh.path = "provision.sh"
        sh.args = "./ansible-tmp /ansible/playbook.yml /vagrant/ansible-inventory"
    end
end
