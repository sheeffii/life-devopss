# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx"
  
  ports {
    internal = 80
    external = 8080
  }

env = [
"E1=0"
]

}
