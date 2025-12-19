resource "yandex_dns_zone" "devops-77-zone" {
  name = "devops-77-zone"
  zone = var.domain_zone
  public = true
}

resource "yandex_dns_recordset" "devops-77-a-record" {
  zone_id = yandex_dns_zone.devops-77-zone.id
  name = var.domain_zone
  type = "A"
  ttl = 300
  data = [yandex_vpc_address.devops-77-external-static-ip.external_ipv4_address[0].address]
}