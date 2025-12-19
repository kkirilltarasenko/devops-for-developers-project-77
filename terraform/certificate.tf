resource "yandex_cm_certificate" "devops-77-cm" {
    name = "devops-77-cm"
    domains = [var.domain]

    managed {
      challenge_type = "DNS_CNAME"
    }
}