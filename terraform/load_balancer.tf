resource "yandex_alb_http_router" "devops-77-router" {
  name = "devops-77-router"
}

resource "yandex_alb_load_balancer" "devops-77-load-balancer" {
  name = "devops-77-load-balancer"
  network_id = data.yandex_vpc_network.default.id

  allocation_policy {
    location {
      zone_id = var.zone
      subnet_id = yandex_vpc_subnet.subnet-1.id
    }
  }

  listener {
    name = "devops-77-listener-http"
    endpoint {
      address {
        external_ipv4_address {
          address = yandex_vpc_address.devops-77-external-static-ip.external_ipv4_address[0].address
        }
      }
      ports = [8080, 80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.devops-77-router.id
      }
    }
  }

  listener {
    name = "devops-77-listener-https"
    endpoint {
      address {
        external_ipv4_address {
          address = yandex_vpc_address.devops-77-external-static-ip.external_ipv4_address[0].address
        }
      }
      ports = [443]
    }
    tls {
      default_handler {
        http_handler {
          http_router_id = yandex_alb_http_router.devops-77-router.id
        }
        certificate_ids = [yandex_cm_certificate.devops-77-cm.id]
      }
      sni_handler {
        name         = "devops-77-sni"
        server_names = [var.domain_zone]
        handler {
          http_handler {
            http_router_id = yandex_alb_http_router.devops-77-router.id
          }
          certificate_ids = [yandex_cm_certificate.devops-77-cm.id]
        }
      }
    }
  }

  log_options {
    disable = true
  }
}

resource "yandex_alb_target_group" "devops-77-alb-target-group" {
  name = "devops-77-target-group"
  folder_id = var.folder_id

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    ip_address = yandex_compute_instance.devops-77-vm-1.network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    ip_address = yandex_compute_instance.devops-77-vm-2.network_interface.0.ip_address
  }
}

resource "yandex_alb_backend_group" "devops-77-backend-group" {
  name = "devops-77-backend-group"

  http_backend {
    name = "http-backend"
    port = 8080

    target_group_ids = [
      yandex_alb_target_group.devops-77-alb-target-group.id
    ]

    healthcheck {
      timeout  = "1s"
      interval = "2s"

      http_healthcheck {
        path = "/"
      }
    }
  }
}

resource "yandex_alb_virtual_host" "devops-77-vhost" {
    name = "devops-77-vhost"
    http_router_id = yandex_alb_http_router.devops-77-router.id
    route {
        name = "devops-77-route"
        http_route {
            http_match {
                path {
                    prefix = "/"
                }
            }
            http_route_action {
                backend_group_id  = yandex_alb_backend_group.devops-77-backend-group.id
                timeout = "60s"
                auto_host_rewrite = false
            }
        }
    }
    authority = [var.domain]
}
