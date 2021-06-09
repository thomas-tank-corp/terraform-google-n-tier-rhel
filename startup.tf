data "template_file" "app_startup_script" {
  template = file("${path.module}/templates/app_startup.sh")

}

data "template_file" "database_startup_script" {
  template = file("${path.module}/templates/database_startup.sh")

}

data "template_file" "web_startup_script" {
  template = file("${path.module}/templates/web_startup.sh")

}

resource "local_file" "app_startup_script" {
  count = var.app ? 1 : 0
  filename = "./.terraform/app_startup.sh"
  content  = data.template_file.app_startup_script.rendered
}

resource "local_file" "web_startup_script" {
  count = var.web ? 1 : 0
  filename = "./.terraform/web_startup.sh"
  content  = data.template_file.app_startup_script.rendered
}

resource "local_file" "database_startup_script" {
  count = var.database ? 1 : 0
  filename = "./.terraform/database_startup.sh"
  content  = data.template_file.app_startup_script.rendered
}
