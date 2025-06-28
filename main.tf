terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Docker network so containers can talk
resource "docker_network" "app_net" {
  name = "app_network"
}

# Generator image
resource "docker_image" "generator" {
  name = "generator:latest"
  build {
    context    = "./generator"
    dockerfile = "./generator/Dockerfile"
  }
}

# Generator container
resource "docker_container" "generator" {
  name  = "generator"
  image = docker_image.generator.image_id
  networks_advanced {
    name = docker_network.app_net.name
  }
  ports {
    internal = 5000
    external = 5000
  }
}

# Consumer image
resource "docker_image" "consumer" {
  name = "consumer:latest"
  build {
    context    = "./consumer"
    dockerfile = "./consumer/Dockerfile"
  }
}

# Consumer container
resource "docker_container" "consumer" {
  name  = "consumer"
  image = docker_image.consumer.image_id
  networks_advanced {
    name = docker_network.app_net.name
  }
  depends_on = [docker_container.generator]
}