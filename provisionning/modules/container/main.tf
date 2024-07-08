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


resource "docker_container" "container" {
  count = 3
  name  = "workstation${count.index}"
  image = "robertolandry/tech-workstation:latest"

  ports {
    internal = "22"
    # external = "22"
  }

  networks_advanced {
    name = var.network_name
    ipv4_address = element(["172.20.0.10", "172.20.0.11", "172.20.0.12"], count.index)
  }

  # save the ip of container in an inventory file 
  provisioner "local-exec" {
    command = "echo ansible_workstation${count.index} ansible_host=${element(["172.20.0.10", "172.20.0.11", "172.20.0.12"], count.index)} ansible_user=techuser ansible_ssh_private_key_file=~/Documents/worketyamo/terraform-docker/provisionning/idkey >> ~/Documents/worketyamo/terraform-docker/inventory.ini"
  }

  # depends_on = [ var.image_infos ]
}


resource "terraform_data" "createa-sommefile" {
  provisioner "local-exec" {
    command = <<-EOT
    echo "[defaults]" > ~/Documents/worketyamo/terraform-docker/ansible.cfg
    echo "host_key_checking = False" >> ~/Documents/worketyamo/terraform-docker/ansible.cfg



    EOT
  }
}


  resource "terraform_data" "delete-sommefile" {
    provisioner "local-exec" {
      when = destroy
      command = <<-EOT
      rm -f ~/Documents/worketyamo/terraform-docker/ansible.cfg
      rm -f ~/Documents/worketyamo/terraform-docker/inventory.ini
      EOT
    }
  }