provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  ami           = "ami-0c7478fd229861c57"
  #instance_type = var.instancetype
  instance_type = "t2.micro"
  key_name = "devopsnew"
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      " sudo systemctl start nginx"
    ]
    connection {
      type = "ssh"
      host = "self.public_ip"
      user = "ec2-user"
      private_key = file("./devopsnew.pem")
    }
  }
}








