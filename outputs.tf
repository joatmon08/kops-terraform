output "access_key" {
  value = "${aws_iam_access_key.kops.id}"
}

output "secret_key" {
  value = "${aws_iam_access_key.kops.encrypted_secret}"
}
