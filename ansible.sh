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
# sudo apt-get install sshpass -y
sudo cat << EOT >> /etc/hosts
10.10.10.100 master
10.10.10.101 node01
10.10.10.102 controlnode
EOT
# sudo cat << EOT >> /etc/ansible/hosts
# [oracle-vm:vars]
# some_server=10.10.10.100
# ansible_ssh_user=vagrant
# ansible_ssh_pass=vagrant
# EOT
# echo "############## Generate a ssh key ##############"
# sudo runuser - vagrant -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y"



# sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@10.10.10.100
# sshpass -p vagrant ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null vagrant@10.10.10.100

# ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa <<< y
## like root
# ssh-copy-id -i /root/.ssh/id_rsa.pub vagrant@10.10.10.100
# sshpass -p vagrant ssh-copy-id -i /root/.ssh/id_rsa.pub vagrant@10.10.10.100
# sshpass -p vagrant ssh-add -i /root/.ssh/id_rsa.pub root@10.10.10.100

# sshpass -p vagrant ssh-copy-id -i /root/.ssh/id_rsa.pub root@10.10.10.100
# sudo runuser - vagrant -c 'cat << EOT >> ~/.ssh/config
# Host 10.10.10.100
#          Port 2200
#          Hostname 10.10.10.100
#          User vagrant
#          HostKeyAlgorithms ssh-dss
#          PubkeyAcceptedKeyTypes=+ssh-dss
# EOT'
sudo cat << EOT >> /etc/ansible/ansible.cfg
[defaults]
host_key_checking = False
EOT
# sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@10.10.10.100
# runuser -l vagrant -c "sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/id_rsa.pub vagrant@10.10.10.100"
# sudo runuser - vagrant -c "sshpass -p vagrant ssh -oStrictHostKeyChecking=no -oUserKnownHostsFile=/dev/null vagrant@10.10.10.100"
# exit
# echo "############## Executing the playbook ##############"
# runuser -l vagrant -c "ansible-playbook /vagrant/playbook.yaml"
# echo "############## THE END ##############"