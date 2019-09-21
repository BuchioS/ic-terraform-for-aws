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
    sudo sed -i -e "s/server_name _/server_name hoge.com/g" /etc/nginx/nginx.conf
    sudo systemctl restart nginx
EOF

}
