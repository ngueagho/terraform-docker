terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
#   version = "> 3.0.2"
  host    = "unix:///var/run/docker.sock"
}

module "image" {
    source = "./modules/image"  
}

module "container" {
    source = "./modules/container"
}

module "create-tag-push" {
  source = "./modules/create-tag-push"
  image_id = module.image.image_id
  image_name= module.image.image_name
}
  

# first export those variables
# export DOCKER_REGISTRY_ADDRESS=registry-1.docker.io
# export DOCKER_REGISTRY_USERNAME=robertolandry
# export DOCKER_REGISTRY_PASSWORD=dckr_pat_asdasd-asdasda-_dsfdfdfrweczxc_sdJJH

# this is the command to apply 
# terraform apply \
# -var="docker_registry_username=$DOCKER_REGISTRY_USERNAME" \
# -var="docker_registry_password=$DOCKER_REGISTRY_PASSWORD"