# JLH - Infrastructure as Code

## Dependencies

Must have terraform installed, as well as the
[Proxmox terraform provider](https://github.com/Telmate/terraform-provider-proxmox/)

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
```
