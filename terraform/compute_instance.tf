resource "yandex_compute_instance" "devops-77-vm-1" {
    name = "devops-77-vm-1"
    platform_id = "standard-v3"
    zone = var.zone
    folder_id = var.folder_id

    resources {
      cores = 2
      memory = 2
    }

    boot_disk {
      disk_id = yandex_compute_disk.disk-vm-1.id
    }

    network_interface {
      subnet_id = yandex_vpc_subnet.subnet-1.id
      nat = true
    }
}

resource "yandex_compute_instance" "devops-77-vm-2" {
    name = "devops-77-vm-2"
    platform_id = "standard-v3"
    zone = var.zone
    folder_id = var.folder_id

    resources {
      cores = 2
      memory = 2
    }

    boot_disk {
      disk_id = yandex_compute_disk.disk-vm-2.id
    }

    network_interface {
      subnet_id = yandex_vpc_subnet.subnet-1.id
      nat = true
    }
}

resource "yandex_compute_disk" "disk-vm-1" {
    name = "devops-77-disk-1"
    type = "network-ssd"
    size = 4
    zone = var.zone
    image_id = var.ubuntu_image_id
    folder_id = var.folder_id
}

resource "yandex_compute_disk" "disk-vm-2" {
    name = "devops-77-disk-2"
    type = "network-ssd"
    size = 4
    zone = var.zone
    image_id = var.ubuntu_image_id
    folder_id = var.folder_id
}