resource "docker_image" "mariadb" {
  name = "mariadb:latest"
  keep_locally = false
}

resource "docker_container" "mariadb" {
  image = docker_image.mariadb.latest
  name  = "mariadb"

  ports {
    internal = 3307
    external = 3307
  }
  env = [
     "MARIADB_USER=shefqet",
     "MARIADB_PASSWORD=123456",
     "MARIADB_ROOT_PASSWORD=123456"
  ]
  networks = ["my_network"]
}
