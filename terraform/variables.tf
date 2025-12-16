variable "cloud_id" {
    description = "Yandex Cloud ID"
    type = string
}

variable "folder_id" {
    description = "Yandex Cloud Folder ID"
    type = string
}

variable "zone" {
    description = "Yandex Cloud Zone"
    type = string
}

variable "path_to_authorized_key" {
    description = "Path to your authorize file"
    type = string
    sensitive = true
}

variable "ubuntu_image_id" {
    description = "Id of ubuntu image on yandex marketplace"
    type = string
}