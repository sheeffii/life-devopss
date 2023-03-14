variable "image_name" {
 description = "name of container"
 type = string
 default = "nginx-dev"
}

variable "port_number" {
 description = "name of container port"
 type = number
 default = "8080"
}
