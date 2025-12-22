resource "yandex_mdb_postgresql_cluster" "devops-77-postgresql-cluster" {
  name = "devops-77-postgresql-cluster"
  environment = "PRESTABLE"
  network_id = data.yandex_vpc_network.default.network_id

  config {
    version = 15
    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-ssd"
      disk_size          = 16
    }
    postgresql_config = {
      max_connections = 395
      enable_parallel_hash = true
      autovacuum_vacuum_scale_factor = 0.34
    }
  }

  maintenance_window {
    type = "WEEKLY"
    day  = "SAT"
    hour = 12
  }

  host {
    zone = var.zone
    subnet_id = yandex_vpc_subnet.subnet-1.id
  }
}


resource "yandex_mdb_postgresql_user" "kirillt" {
  cluster_id = yandex_mdb_postgresql_cluster.devops-77-postgresql-cluster.id
  name = var.db_user
  password = var.db_password
  conn_limit = 50
  settings = {
    default_transaction_isolation = "read committed"
    log_min_duration_statement = 5000
  }
}

resource "yandex_mdb_postgresql_database" "my_db" {
  cluster_id = yandex_mdb_postgresql_cluster.devops-77-postgresql-cluster.id
  name = "db1"
  owner = yandex_mdb_postgresql_user.kirillt.name
  lc_collate = "en_US.UTF-8"
  lc_type    = "en_US.UTF-8"
}