# JLH - Infrastructure as Code

## Dependencies

Must have terraform installed, as well as the
[Proxmox terraform provider](https://github.com/Telmate/terraform-provider-proxmox/)

Install the latest community.general collection in order to get a working proxmox API

```shell script
git clone git@github.com:ansible-collections/community.general.git ~/.ansible/collections/ansible_collections/community/general
```

## Environment variables for terraform

* PM_API_URL
    * The target Proxmox API endpoint
* PM_USER
    * The username for Proxmox, typically `root@pam`.
* PM_PASS
    * The password for Proxmox

## Useful commands
```shell script
ansible -i inventory.yml swablu -m ping
PROXMOX_PASSWORD=secret ansible-playbook -i inventory.yml site.yml
PROXMOX_PASSWORD=secret ansible-playbook -i inventory.yml delete_host.yml
```
