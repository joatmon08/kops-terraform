provider "aws" {
  region = "${var.region}"
}

resource "aws_iam_group_policy" "kops" {
  name  = "kops_policy"
  group = "${aws_iam_group.kops.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "route53:*",
        "s3:*",
        "iam:*",
        "elasticloadbalancing:*",
        "autoscaling:*",
        "kms:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_group" "kops" {
  name = "kops"
}

resource "aws_iam_user" "kops" {
  name = "kops"
}

resource "aws_iam_access_key" "kops" {
  user    = "${aws_iam_user.kops.name}"
  pgp_key = "${var.key}"
}

resource "aws_iam_group_membership" "kops" {
  name = "kops_group_membership"

  users = [
    "${aws_iam_user.kops.name}",
  ]

  group = "${aws_iam_group.kops.name}"
}
