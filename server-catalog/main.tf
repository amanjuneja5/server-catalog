terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 2.0.0"
    }
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "openstack" {
  user_name           = "demo"
  tenant_name         = "demo"
  password            = "sIhI30sIygzC"
  user_domain_name    = "users"
  project_domain_name = "users"
  auth_url            = "http://10.20.21.12/openstack-keystone/v3"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "openstack_compute_instance_v2" "inference-server" {
  count           = var.vm-count
  name            = "${var.name}-${count.index}"
  image_id        = "a3f2106a-84bf-4751-99a3-a4bc0fd234e2"
  flavor_id       = "129c029e-5cc3-4005-8cd3-466fd95bf03c"
  key_pair        = "sunbeam"
  security_groups = ["default"]

  network {
    name = "demo-network"
  }
}

resource "docker_container" "triton" {
  count = var.containers-count
  name  = "${var.name}-${count.index}"
  image = "nvcr.io/nvidia/tritonserver:24.03-vllm-python-py3"
  # entrypoint = ["sleep 3600"]
}