# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = var.image_name

  ports {
    internal = 80
    external = var.port_number
  }

  env = [
    "E1=0"
  ]

}
