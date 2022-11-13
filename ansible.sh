#!/bin/bash
echo "##############  Update OS ############## "
apt-add-repository ppa:ansible/ansible
apt-get update -y
echo "##############  Install Ansible ############## "
apt install ansible -y
cat << EOT >> /etc/ansible/hosts
[master]
10.10.10.100
EOT
sudo cat << EOT >> /etc/hosts
10.10.10.100 master
10.10.10.101 node01
10.10.10.102 controlnode
EOT
sudo cat << EOT >> /etc/ansible/ansible.cfg
[defaults]
host_key_checking = False
EOT
