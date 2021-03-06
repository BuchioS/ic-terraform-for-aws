resource "aws_instance" "web" {
  ami           = "${data.aws_ami.amzn2.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.auth.id}"

  subnet_id = "${aws_subnet.public-a.id}"
  vpc_security_group_ids = ["${aws_security_group.pub-a.id}"]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name = "web-instance"
  }

  user_data = <<EOF
    #!/bin/bash
    amazon-linux-extras install nginx1.12
    systemctl start nginx.service
EOF

}

resource "aws_instance" "ap" {
  ami           = "${data.aws_ami.amzn2.id}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.auth_priv.id}"

  subnet_id = "${aws_subnet.private-a.id}"
  vpc_security_group_ids = ["${aws_security_group.priv-a.id}"]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  tags = {
    Name = "ap-instance"
  }

  user_data = <<EOF
    #!/bin/bash
    yum install -y https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
    yum-config-manager --disable mysql80-community
    yum-config-manager --enable mysql57-community
    yum install -y mysql-community-client
EOF

}
