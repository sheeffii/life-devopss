resource "docker_image" "phpmyadmin" {
  name = "phpmyadmin:latest"
  keep_locally = false
}

resource "docker_container" "phpmyadmin" {
  image = docker_image.mariadb.latest
  name  = "phpmyadmin"

  ports {
    internal = 80
    external = 5000
  }
  env = [
     "PMA_HOST=mariadb"
  ]
  networks = ["my_network"]
}
