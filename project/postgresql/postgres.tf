resource "docker_image" "postgres" {
  name         = "postgres:latest"
  keep_locally = false
}

  resource "docker_container" "postgres" {
    image = docker_image.postgres.image_id
    name  = "postgres"

  ports {
    internal = 5432
    external = 5432
  }

  network_mode = docker_network.database_network.name

  env = [
    "POSTGRES_PASSWORD=admin",
    "POSTGRES_USER=admin",
    "POSTGRES_DB=postgres"
  ]
}
