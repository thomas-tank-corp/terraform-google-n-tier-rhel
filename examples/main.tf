module "n-tier-rhel" {
  source  = "app.terraform.io/tom-se-hashi/n-tier-rhel/google"
  version = "0.2.0"
  project      = "gcp-project"
  prefix       = "test"
  region       = "europe-west2"
  vpc          = "default"
  subnet       = "default"
  subnet_range = "10.154.0.0/20"

  web          = true
  webserver_instance_config = {
    disk_image   = "rhel-7-v20200403"
    disk_size    = "200"
    disk_type    = "pd-ssd"
    target_size  = "1"
    machine_type = "n1-standard-1"
  }

  app          = true
  app_server_instance_config = {
    disk_image   = "rhel-7-v20200403"
    disk_size    = "200"
    disk_type    = "pd-ssd"
    target_size  = "1"
    machine_type = "n1-standard-1"
  }

  database     = true
  database_instance_config = {
    disk_image   = "rhel-7-v20200403"
    disk_size    = "200"
    disk_type    = "pd-ssd"
    target_size  = "1"
    machine_type = "n1-standard-1"
  }
}