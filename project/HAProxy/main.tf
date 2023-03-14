terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.1"
    }
  }
}

provider "docker" {}

resource "docker_network" "network1" {
  name = "network1"
}

resource "docker_container" "nginx1" {
  name  = "nginx1"
  image = "nginx"
  ports {
	internal = 80
	external = 9001
}
    networks = ["network1"]
}

resource "docker_container" "nginx2" {
  name  = "nginx2"
  image = "nginx"
  ports {
        internal = 80
        external = 9002
}
  #provisioner "local-exec" {
    #command = <<EOF
      # Install HAProxy
      #apt-get update
      #apt-get install haproxy -y

      # Copy HAProxy configuration file
      #cp /home/demo/HAProxy/haproxy.cfg /etc/haproxy/haproxy.cfg
      #systemctl restart haproxy
    #EOF
  #}
       networks = ["network1"]
}
