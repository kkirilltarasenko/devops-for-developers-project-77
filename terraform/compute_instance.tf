resource "yandex_compute_disk" "disk" {
  for_each = var.vms

  name      = "devops-77-disk-${each.key}"
  type      = "network-ssd"
  size      = 10
  zone      = var.zone
  image_id  = var.ubuntu_image_id
  folder_id = var.folder_id
}

resource "yandex_compute_instance" "vm" {
  for_each = var.vms

  name        = "devops-77-${each.key}"
  platform_id = "standard-v3"
  zone        = var.zone
  folder_id   = var.folder_id

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.disk[each.key].id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = templatefile("${path.module}/cloud-init.yaml", {
      ssh_user        = var.ssh_user
      ssh_public_key = file(var.ssh_public_key)
      packages        = each.value.python_packages
    })
  }
}