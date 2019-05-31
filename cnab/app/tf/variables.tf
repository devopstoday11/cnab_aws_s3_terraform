variable "access_key_id" {}
variable "secret_key_id" {}

variable "region" {
  default = "ca-central-1"
}

variable "bucket" {
  default = "my-tf-test-bucket"
}

variable "bucket_name" {
  default = "My First Bucket"
}

variable "environment" {
  default = "poc"
}
