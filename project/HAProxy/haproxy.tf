resource "docker_image" "haproxy" {
  name = "haproxy:latest"
}

resource "docker_container" "haproxy" {
  name  = "haproxy"
  image = docker_image.haproxy.name
  network_mode = "host"
  command = ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
  ports {
    internal = 80
    external = 8080
  }
}
