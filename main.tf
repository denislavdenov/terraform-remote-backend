terraform {
  backend "atlas" {
    name    = "ddenov/tf-atlas"
  }
}

resource "null_resource" "helloWorld" {
  provisioner "local-exec" {
    command = "echo hello world"
  }
}
