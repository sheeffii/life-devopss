variable "image_name" {
 description = "name of container"
 type = string
 default = "nginx-stage"
}

variable "port_number" {
 description = "name of container port"
 type = number
 default = "8082"
}
