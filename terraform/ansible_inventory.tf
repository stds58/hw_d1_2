locals {
  depends_on = [
    module.manager,
    module.node1,
    module.node2
  ]

  inventory_template = templatefile(
    "${path.module}/inventory.tpl", {
      manager_ip = module.manager.external_ip_address
      node1_ip   = module.node1.external_ip_address
      node2_ip   = module.node2.external_ip_address
    }
  )
}

resource "local_file" "inventory" {
  depends_on = [
    module.manager,
    module.node1,
    module.node2
  ]
  content  = local.inventory_template
  filename = "${path.root}/../ansible/inventory.ini"
}
