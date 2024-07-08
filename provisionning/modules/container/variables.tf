variable "image_name" {
    description = "image name "
}

variable "image_infos" {
    description = "image "
}


variable "container_name" {
  type = list(string)
  default = [ "container1" , "container2" , "container3"]
}

variable "network_name" {
  type = string
  description = "name of network created"
}
