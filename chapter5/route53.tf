data "aws_route53_zone" "hoge-net" {
  name = "ドメイン名."
}

#web
resource "aws_route53_record" "web" {
  zone_id = "${data.aws_route53_zone.hoge-net.zone_id}"
  name    = "${data.aws_route53_zone.hoge-net.name}"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web.public_ip}"]
}

resource "aws_route53_zone" "in" {
  name = "in.instancecoffee"

  vpc {
    vpc_id = "${aws_vpc.vpc.id}"
    vpc_region = "ap-northeast-1"
  }
  tags = {
    Name = "Internal DNS"
  }
}

#web
resource "aws_route53_record" "web-in" {
  zone_id = "${aws_route53_zone.in.zone_id}"
  name    = "web.in.instancecoffee"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.web.private_ip}"]
}

#ap
resource "aws_route53_record" "ap-in" {
  zone_id = "${aws_route53_zone.in.zone_id}"
  name    = "ap.in.instancecoffee"
  type    = "A"
  ttl     = "300"
  records = ["${aws_instance.ap.private_ip}"]
}

#rds
resource "aws_route53_record" "aurora-clstr-in" {
  zone_id = "${aws_route53_zone.in.zone_id}"
  name    = "rds.in.instancecoffee"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_rds_cluster.aurora-clstr.endpoint}"]
}

resource "aws_route53_record" "aurora-clstr-ro-in" {
  zone_id = "${aws_route53_zone.in.zone_id}"
  name    = "rds-ro.in.instancecoffee"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_rds_cluster.aurora-clstr.reader_endpoint}"]
}
