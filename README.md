# JLH - Infrastructure as Code
An Ansible playbook for provisioning and configuring my homelab infrastructure

This playbook runs from my base install of a proxmox host with an internal FreeNAS VM for storage, and then builds up
LXC containers for all of my services.

Containers are named after pokemon related to their function, and are described in the `host_vars/` directory

## Dependencies

Install the latest git version of the community.general ansible collection in order to get a working proxmox API

```shell script
git clone git@github.com:ansible-collections/community.general.git ~/.ansible/collections/ansible_collections/community/general
```

## Useful commands
```shell script
ansible -i inventory.yml swablu -m ping
PROXMOX_PASSWORD=secret ansible-playbook -i inventory.yml site.yml
PROXMOX_PASSWORD=secret ansible-playbook -i inventory.yml delete_host.yml
```
