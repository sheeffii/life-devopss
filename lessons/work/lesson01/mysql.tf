# Pulls the image
resource "docker_image" "mysql" {
  name = "mysql:latest"
}

# Create a container
resource "docker_container" "mysql" {
  image = docker_image.mysql.image_id
  name  = "mysql"
  
  ports {
    internal = 3306
    external = 3306
  }

  env = [
    "E1=0",
    "MYSQL_ALLOW_EMPTY_PASSWORD=0"
  ]

  volumes {
    volume_name = "mysql_volume"
    container_path = "/mnt"
 }

}
