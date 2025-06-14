
module "network" {
  source = "./modules/network"

  network_name = "uc_network"
}

module "subnetwork" {
  source = "./modules/subnet"

  subnet_name    = "uc_subnetwork"
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["192.168.10.0/24"]
  network_id     = module.network.network_id
}

data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}


module "manager" {
  source = "./modules/instance"

  instance_name      = "manager"
  platform_id        = "standard-v3"
  zone               = "ru-central1-a"
  cores              = 2
  memory             = 4
  core_fraction      = 100
  image_id           = data.yandex_compute_image.ubuntu.id
  disk_size          = 20
  disk_type          = "network-ssd"
  subnet_id          = module.subnetwork.subnet_id
  nat                = true

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/terraform_20250320.pub")}"
  }

  labels = {
    environment = "manager"
    terraform   = "true"
    role        = "manager"
  }
}

module "node1" {
  source = "./modules/instance"

  instance_name      = "node1"
  platform_id        = "standard-v3"
  zone               = "ru-central1-a"
  cores              = 2
  memory             = 4
  core_fraction      = 100
  image_id           = data.yandex_compute_image.ubuntu.id
  disk_size          = 20
  disk_type          = "network-ssd"
  subnet_id          = module.subnetwork.subnet_id
  nat                = true

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/terraform_20250320.pub")}"
  }

  labels = {
    environment = "node1"
    terraform   = "false"
    role        = "node"
  }
}

module "node2" {
  source = "./modules/instance"

  instance_name      = "node2"
  platform_id        = "standard-v3"
  zone               = "ru-central1-a"
  cores              = 2
  memory             = 4
  core_fraction      = 100
  image_id           = data.yandex_compute_image.ubuntu.id
  disk_size          = 20
  disk_type          = "network-ssd"
  subnet_id          = module.subnetwork.subnet_id
  nat                = true

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/terraform_20250320.pub")}"
  }

  labels = {
    environment = "node2"
    terraform   = "false"
    role        = "node"
  }
}

