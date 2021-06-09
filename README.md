# terraform-google-rhel-n-tier


///// example main.tf for 3 tier app 


terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "tom-se-hashi"
    workspaces {
      name = "3tier-app-windows-dev"
    }
  }
}


///// not all tiers need to be called. use the "web", "app" and "database" boolean arguments to set if the respective tier should be included

module "rhel-n-tier" {
  source  = "app.terraform.io/tom-se-hashi/rhel-n-tier/google"
  version = "0.2.0"
  project      = "project"
  prefix       = var.prefix
  subnet_range = var.subnet_range
  web          = true   
  app          = true
  database     = true

  webserver_instance_config = {
    disk_image   = "rhel-7-v20200403"
    disk_size    = "200"
    disk_type    = "pd-ssd"
    target_size  = "1"
    machine_type = "n1-standard-1"
  }

  app_server_instance_config = {
    disk_image   = "rhel-7-v20200403"
    disk_size    = "200"
    disk_type    = "pd-ssd"
    target_size  = "1"
    machine_type = "n1-standard-1"
  }

  database_instance_config = {
    disk_image   = "rhel-7-v20200403"
    disk_size    = "200"
    disk_type    = "pd-ssd"
    target_size  = "1"
    machine_type = "n1-standard-1"
  }
}


