# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 512
    v.cpus = 1
  end

  # Vagrant machine for provisioning a PostgreSQL version 9.4 cluster.
  config.vm.define 'ap94' do |c|
    c.vm.box = 'ubuntu/trusty64'
    c.vm.network :private_network, ip: '192.168.88.23'
    c.vm.hostname = 'ap94.local'
    c.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'test.yml'
      ansible.extra_vars = {
        postgresql_version: 9.4
      }
      ansible.verbose = 'vv'
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end
  end

  # Vagrant machine for provisioning a PostgreSQL version 9.3 cluster.
  config.vm.define 'ap93' do |c|
    c.vm.box = 'ubuntu/trusty64'
    c.vm.network :private_network, ip: '192.168.88.24'
    c.vm.hostname = 'ap93.local'
    c.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'test.yml'
      ansible.extra_vars = {
        postgresql_version: 9.3
      }
      ansible.verbose = 'vv'
      ansible.inventory_path = 'vagrant-inventory'
      ansible.host_key_checking = false
    end
  end

end
