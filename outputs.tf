output "aws_access_key_id" {
  value = "${aws_iam_access_key.kops.id}"
}

output "aws_secret_access_key" {
  value = "${aws_iam_access_key.kops.encrypted_secret}"
}

output "bucket_name" {
  value = "${var.bucket_name}"
}

output "region" {
  value = "${var.region}"
}