variable "container_info" {
  type = object({
    name = string
    context = string
    dockerfile = string
    tag = list(string)
    foo = string
    author = string
  })
  default = {
    name = "tech-workstation"
    context = "."
    dockerfile = "Dockerfile"
    tag = ["tech-workstation:latest"]
    foo = "tech-workstation "
    author = "[ROBERTO LANDRY]"
  }
}

