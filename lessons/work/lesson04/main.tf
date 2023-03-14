resource "docker_image" "redis" {
  name = "redis:latest"
}

resource "docker_container" "redis" {
  image = docker_image.redis.image_id
  name  = "redis"

  ports {
    internal = 6379
    external = 6379
  }
  networks = ["shs_network"]
}

resource "docker_image" "redis-insight" {
  name = "redislabs/redisinsight:latest"
  keep_locally = false
}

resource "docker_container" "redis-insight" {
  image = docker_image.redis-insight.image_id
  name  = "redis"

  ports {
    internal = 6379
    external = 6379
  }
  networks = ["shs_network"]
}

