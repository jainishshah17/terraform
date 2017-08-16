output "address" {
  value = "${aws_elb.web.dns_name}"
}

output "access" {
  value = "${aws_iam_access_key.s3.id}"
}

output "secret" {
  value = "${aws_iam_access_key.s3.secret}"
}

output "s3-bucketname" {
  value = "${aws_s3_bucket.b.region}"
}
