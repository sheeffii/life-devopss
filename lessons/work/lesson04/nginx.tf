resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  count = var.env == "prod" ? 3 : 1
  image = docker_image.nginx.image_id
  name  = "nginx"

  ports {
    internal = 80
    external = "500${count.index}"
  }

  networks = ["shs_network"]
}
