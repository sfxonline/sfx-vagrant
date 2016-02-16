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
    config.vm.box = "ubuntu/vivid64"
    config.vm.network :private_network, ip: "33.33.33.10"
    config.vm.hostname = projectname

    #config.vm.synced_folder "./www", "/home/vagrant/www", create: true

    config.vm.provider "virtualbox" do |vb|
        vb.name = projectname
        vb.customize ["modifyvm", :id, "--cpus", 2]
        vb.customize ["modifyvm", :id, "--ioapic", "on"]
        vb.customize ["modifyvm", :id, "--memory", 2048]
        vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    end

    if OS.windows?
        config.vm.synced_folder "./ansible", "/ansible"
        config.vm.provision :shell do |sh|
            sh.keep_color = true
            sh.privileged = false
            sh.path = "provision.sh"
            sh.args = "./ansible-tmp /ansible/playbook.yml /vagrant/ansible-inventory"
        end
    else
        config.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/playbook.yml"
            ansible.inventory_path = "ansible-inventory"
            ansible.limit = "vagrant"
        end
    end
end
