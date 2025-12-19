terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }

    datadog = {
      source = "DataDog/datadog"
    }
  }
  required_version = ">= 0.13"
}

