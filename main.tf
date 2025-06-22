terraform {
  required_version = ">= 1.0"
}

provider "local" {
  # No config needed
}

resource "local_file" "testfile" {
  filename = "${path.module}/hello.txt"
  content  = "Hello from Terraform!"
}
