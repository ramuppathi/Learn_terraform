locals {
  instance_ami         = data.aws_ami.latest_amazon_linux.id
  instance_subnet      = data.aws_subnet.selected.id
  instance_key_pair    = aws_key_pair.student.key_name
  instance_tags        = {
    "Name" = format("RamInstance-%s", formatdate("YYYYMMDD", timestamp()))
  }
}

resource "aws_instance" "example" {
  ami           = local.instance_ami
  instance_type = var.instance_type
  subnet_id     = local.instance_subnet
  key_name      = local.instance_key_pair

  tags = local.instance_tags

  # Specify dependencies explicitly using depends_on if needed
  depends_on = [
    aws_key_pair.student,
    data.aws_subnet.selected,
    data.aws_ami.latest_amazon_linux,
  ]

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}


output "instance_type" {
 value = aws_instance.example.instance_type
}

variable "instance_type" {}
