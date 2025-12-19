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

variable "db_password" {
    description = "Password to admin user in database"
    type = string
    sensitive = true
}

variable "ssh_path" {
    description = "Path to ssh in local machine"
    type = string
    sensitive = true
}

variable "ssh_user" {
    description = "Root user in vm"
    type = string
    sensitive = true
}

variable "domain_zone" {
    description = "Domain zone for creating new DNS"
    type = string
}

variable "domain" {
    description = "Main domain name"
    type = string
}

variable "datadog_api_key" {
    description = "Datadog api key"
    type = string
    sensitive = true
}

variable "datadog_app_key" {
    description = "Datadog app key"
    type = string
    sensitive = true
}

variable "datadog_api_url" {
    description = "Datadog api url"
    type = string
}