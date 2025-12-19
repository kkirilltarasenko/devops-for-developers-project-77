data "yandex_vpc_network" "default" {
    name = "default"
}

resource "yandex_vpc_subnet" "subnet-1" {
    name = "vpc-subnet-1"
    network_id     = data.yandex_vpc_network.default.id
    zone           = var.zone
    v4_cidr_blocks = ["10.0.0.0/24"]
    folder_id = var.folder_id
}

resource "yandex_vpc_address" "devops-77-external-static-ip" {
  name = "devops-77-external-static-ip"

  external_ipv4_address {
    zone_id = var.zone
  }
}