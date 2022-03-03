
terraform {
  backend "s3" {
    bucket = "automate-ec3"
    key    = "bootcamp/ec2/terraform.tfstate"
    region = "us-east-1"
    #      dynamodb_table       = "terraform-lock"
  }
}





# create instance
resource "aws_instance" "web" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = "LEMPAWS"
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-tf-instance"
  }
  user_data = file("${path.module}/script.sh")
}





