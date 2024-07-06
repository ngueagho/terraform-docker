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
  name = "tech-workstation"
  build {
    context = "."  # Utilisez le chemin absolu
    dockerfile = "Dockerfile"
    tag     = ["tech-workstation:latest"]
    build_arg = {
      foo = "tech-workstation "
    }
    label = {
      author = "[ROBERTO LANDRY]"
    }
  }
}
