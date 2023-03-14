variable "names" {
  type    = set(string)
  default = ["nginx-01", "nginx-02", "nginx-03"]
}

variable "names_list" {
  type    = list(string)
  default = ["nginx-01", "nginx-02", "nginx-03"]
}

output "a" {
 value = [for a in var.names : upper (a)]
}

variable "kastriot" {
 type   = bool
 default = true
}

variable "mysql_names" {
  type    = set(string)
  default = ["nginx-01", "nginx-02", "nginx-03"]
}
