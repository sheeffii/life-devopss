#variable "life" {
 #type   = bool
 #default = true
#}

output "nginx_container_name" {
  value = docker_container.nginx.name
}
