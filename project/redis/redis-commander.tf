resource "docker_image" "redis-commander" {
  name         = "rediscommander/redis-commander:latest"
  keep_locally = false
}

resource "docker_container" "redis-commander" {
  image = docker_image.redis-commander.image_id
  name  = "redis-commander"
  ports {
    internal = 8081
    external = 8081
  }
  network_mode = docker_network.redis_network.name
  depends_on = [docker_container.redis]
}
