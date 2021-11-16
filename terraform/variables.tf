
variable "image_name" {
  type    = string
}

variable "docker_server_url" {
  type    = string
}

variable "docker_username" {
  type    = string
}

variable "docker_password" {
  type      = string
  sensitive = true
}


variable "subscription_id" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "tenant_id" {
  type = string
}
