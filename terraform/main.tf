terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.zone
  cloud_id = var.cloud_id
  folder_id = var.folder_id
  service_account_key_file = var.path_to_authorized_key
}