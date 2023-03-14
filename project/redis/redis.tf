resource "docker_image" "redis" {
  name         = "redis:latest"
  keep_locally = false
}

resource "docker_container" "redis" {
  image = docker_image.redis.image_id
  name  = "redis"
  ports {
    internal = 6379
    external = 6379
  }
  network_mode = docker_network.redis_network.name

  env = [
    "REDIS_HOST=redis",
    "REDIS_PASSWORD=redis",
    "REDIS_PORT=6379"
  ]
}
