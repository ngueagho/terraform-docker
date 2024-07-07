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
}

resource "docker_image" "tech-workstation" {
  name = var.container_info.name
  build {
    context = var.container_info.context # Utilisez le chemin absolu
    dockerfile = var.container_info.dockerfile
    tag     = var.container_info.tag
    build_arg = {
      foo = var.container_info.foo
    }
    label = {
      author = var.container_info.author
    }
  }
}
