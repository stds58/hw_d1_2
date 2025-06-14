
output "manager_external_ip" {
  value = module.manager.external_ip_address
}

output "node1_external_ip" {
  value = module.node1.external_ip_address
}

output "node2_external_ip" {
  value = module.node2.external_ip_address
}

output "ssh_connection_command" {
  value = <<EOT
    ssh -i ~/.ssh/terraform_20250320 ubuntu@${module.manager.external_ip_address}
    ssh -i ~/.ssh/terraform_20250320 ubuntu@${module.node1.external_ip_address}
    ssh -i ~/.ssh/terraform_20250320 ubuntu@${module.node2.external_ip_address}
    Как проверить, какие версии Python есть на ноде?
        Вы можете запустить команду через Ansible:
            ansible worker2 -m shell -a "ls /usr/bin/python*"
        Или подключиться по SSH и проверить вручную:
            which python3
            python3 --version
            ls -l /usr/bin/python*
  EOT
}