resource "yandex_lb_network_load_balancer" "devops-77-lb" {
    name = "devops-77-lb"
    region_id = "ru-central1"

    listener {
      name = "http-listener"
      port = 80
      target_port = 8080
      external_address_spec {
        address = yandex_vpc_address.devops-77-external-static-ip.external_ipv4_address[0].address
        ip_version = "ipv4"
      }
    }

    listener {
      name = "https-listener"
      port = 443
      target_port = 443
      external_address_spec {
        address = yandex_vpc_address.devops-77-external-static-ip.external_ipv4_address[0].address
        ip_version = "ipv4"
      }
    }

    attached_target_group {
      target_group_id = yandex_lb_target_group.devops-77-target-group.id

      healthcheck {
        name = "devops-77-target-group-healthcheck"

        http_options {
          port = 8080
          path = "/"
        }
      }
    }
}

resource "yandex_lb_target_group" "devops-77-target-group" {
  name = "devops-77-target-group"
  region_id = "ru-central1"
  folder_id = var.folder_id

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address = yandex_compute_instance.devops-77-vm-1.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address = yandex_compute_instance.devops-77-vm-2.network_interface.0.ip_address
  }
}