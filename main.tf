terraform {
  required_version = ">= 0.14.0"
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

module "server-catalog" {
  source           = "./server-catalog"
  vm-count         = var.vm-count
  name             = var.catalog-name
  containers-count = var.containers-count
}

