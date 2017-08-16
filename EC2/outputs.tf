output "public_ip" {
  value = "${aws_instance.artifactory.public_ip}"
}