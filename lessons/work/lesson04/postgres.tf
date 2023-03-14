resource "docker_image" "postgres" {
  name = "postgres:latest"
  keep_locally = false
}

resource "docker_container" "postgres" {
  image = docker_image.postgres.image_id
  name  = "postgres"

  ports {
    internal = 5432
    external = 5432
  }
  env = [
     "POSTGRES_PASSWORD=123456"
  ]
  volumes {
  volume_name = "posgres_volume"
  container_path = "/var/lib/postgresql/data"
  }

  networks = ["shs_network"]
}

resource "docker_image" "pgadmin" {
  name = "truecharts/pgadmin:latest"
  keep_locally = false
}

resource "docker_container" "pgadmin" {
  image = docker_image.pgadmin.image_id
  name  = "pgadmin"

  ports {
    internal = 80
    external = 80
  }
  env = [
     "PGADMIN_DEFAULT_EMAIL=user@domain.com",
     "PGADMIN_DEFAULT_PASSWORD=SuperSecret"
  ]

  networks = ["shs_network"]
}
