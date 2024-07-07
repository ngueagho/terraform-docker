variable "docker_hub_username" {
    type = string
    description = "Docker Hub username"
     default = " "
}

variable "docker_hub_password" {
    type = string
    description = "Docker Hub password"
    sensitive   = true
    default = ""
}   

variable "image_id" {
    description = "image_id"
    type = string
}

variable "image_name" {
    description = "image name "
} 
 variable "target_image" {
   type = string
   default = "registry-1.docker.io/robertolandry/tech-workstation"
 }


 variable "docker_registry_address" {
  description = "Adresse du registre Docker"
  type        = string
  default     = "registry-1.docker.io"
}

variable "docker_registry_username" {
  description = "Nom d'utilisateur pour le registre Docker"
  type        = string
}

variable "docker_registry_password" {
  description = "Mot de passe pour le registre Docker"
  type        = string
}