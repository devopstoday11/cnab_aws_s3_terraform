terraform {
  required_version = ">= 0.11"
}

provider "aws" {
  access_key = "${var.access_key_id}"
  secret_key = "${var.secret_key_id}"
  region     = "${var.region}"
}
