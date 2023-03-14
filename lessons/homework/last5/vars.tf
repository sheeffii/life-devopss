output "container_name" {
  description = "Docker container name"
  value = docker_container.nginx.name
}

variable "emri_i_container"{
  type = string
  default = "nginx1"
}
