provider "aws" {
  region = "${var.region}"
}

resource "aws_s3_bucket" "joatmon08" {
  bucket = "joatmon08"
  acl    = "private"
}
