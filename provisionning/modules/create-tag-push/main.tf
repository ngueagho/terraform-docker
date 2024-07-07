terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address  = "registry-1.docker.io"
    username = "robertolandry"
    password = "dckr_pat_GWL-mS6G0G-_Egdlh2NECY_AYaY"
  }
#   registry_auth {
#     address  = var.docker_registry_address
#     username = var.docker_registry_username
#     password = var.docker_registry_password
#   }

}

# tag the image 
resource "docker_tag" "image-tag" {
    source_image = var.image_name
    target_image = var.target_image
}


# push the image 
resource "docker_registry_image" "image-push" {
  name = var.target_image
  
  depends_on = [
    docker_tag.image-tag
  ]
}