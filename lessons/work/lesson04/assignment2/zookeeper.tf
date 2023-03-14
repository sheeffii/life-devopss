resource "docker_image" "zookeeper" {
  name = "zookeeper:latest"
  keep_locally = false
}

resource "docker_container" "zookeeper" {
  image = docker_image.zookeeper.image_id
  name  = "zookeeper"

  ports {
    internal = 2181
    external = 2181
  }

  networks = ["my_network"]
}
