resource "aws_key_pair" "student" {
  key_name   = "training-u20"
  public_key = file("/home/ubuntu/Awstflab/training.u20-vm-key.pub")  # Path to your public key file
}
