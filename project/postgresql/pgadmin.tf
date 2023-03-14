resource "docker_image" "pgadmin" {
  name         = "dpage/pgadmin4:latest"
  keep_locally = false
}

resource "docker_container" "pgadmin" {
  image = docker_image.pgadmin.image_id
  name  = "pgadmin"

  ports {
    internal = 80
    external = 81
  }

  network_mode = docker_network.database_network.name
  depends_on = [docker_container.postgres]

  env = [
     "PGADMIN_DEFAULT_EMAIL=admin@admin.com",
     "PGADMIN_DEFAULT_PASSWORD=admin"
  ]
}
