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
### Terraform
```shell script
terraform init
terraform fmt
PM_PASS='SECRET' terraform validate
rm terraform.tfstate
PM_PASS='SECRET' terraform apply
```
### Ansible
```shell script
ansible -i ansible_hosts.ini swablu -m ping
ansible-playbook -i ansible_hosts.ini site.yml
```
### misc
```shell script
ssh-keygen -R "swablu.home.jlh.name"
```
