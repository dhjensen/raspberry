# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "geerlingguy/debian10"
  config.vm.provider :virtualbox do |v|
    v.memory = 512
  end
  config.ssh.insert_key = false

  config.vm.define "pi" do |pi|

    pi.vm.hostname = "pi"

    pi.vm.network :private_network, ip: "192.168.46.84", name: "vboxnet0"

    # Ansible provisioning.
    pi.vm.provision "ansible" do |ansible|
      ansible.playbook = "main.yml"
      ansible.become = true
      #ansible.verbose = "vvvv"
      ansible.extra_vars = {
        ansible_python_interpreter: "/usr/bin/python3",
      }
    end
  end

  config.vm.define "client", autostart: false do |client|
    client.vm.hostname = "client"

    client.vm.network :private_network, type: "dhcp", name: "vboxnet0"
  end
end
