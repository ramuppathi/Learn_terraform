data "aws_vpc" "selected" {
  id = "vpc-03276c8c78a4712ed"
}
data "aws_subnet" "selected" {
  id = "subnet-0b8247990e5452a3b"
}
output "selected_vpc_details" {
  value = {
    id          = data.aws_vpc.selected.id
    cidr_block  = data.aws_vpc.selected.cidr_block
    subnet = data.aws_subnet.selected.id
    # Add more attributes as needed
  }
}