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





# Utilisez Terraform pour créer un réseau Docker nommé technet avec le
# sous-réseau 172.20.0.0/16.
resource "docker_network" "technet" {
  name   = "technet"
  driver = "bridge"

  ipam_config {
    subnet = "172.20.0.0/16"
  }
}
