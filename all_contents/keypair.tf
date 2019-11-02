resource "aws_key_pair" "auth" {
  key_name   = "id_rsa.pub"
  public_key =  "ssh-rsa xxx"
}

resource "aws_key_pair" "auth_priv" {
  key_name   = "id_rsa_priv.pub"
  public_key = "ssh-rsa xxx"
}
