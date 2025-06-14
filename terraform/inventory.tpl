[manager]
manager_node ansible_host=${manager_ip} ansible_user=ubuntu

[workers]
worker1 ansible_host=${node1_ip} ansible_user=ubuntu
worker2 ansible_host=${node2_ip} ansible_user=ubuntu

[all:vars]
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
ansible_ssh_private_key_file=~/.ssh/terraform_20250320

