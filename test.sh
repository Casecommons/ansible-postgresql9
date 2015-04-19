#!/bin/sh

# Provision the Vagrant machines with Ansible.
vagrant up

# Rerun the same Ansible playbook to check for idempotency.
ansible-playbook test.yml -i vagrant-inventory \
  -u vagrant --private-key=.vagrant/machines/ap/virtualbox/private_key \
  -e '@test_vars.yml' -vv
