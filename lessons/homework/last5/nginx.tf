resource "docker_image" "nginx" {
  name         = "nginx:latest"
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.emri_i_container
  ports {
    internal = 80
    external = "8080"
  }
}
