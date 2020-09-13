provider "aws" {
  region  = "us-east-1"
  profile = "<youraccount_ID>PowerUser"
}
resource "aws_instance" "my-instance" {
  count         = "${var.instance_count}"
  ami           = "${lookup(var.ami,var.aws_region)}"
  instance_type = "${var.instance_type}"
  key_name      = "non-prod-admin"
  subnet_id = "subnet-a0c3f5fd"
  security_groups = [ "sg-fae5ff8c" ]
  iam_instance_profile = "next_ec2_team_35"
  #user_data     = "${file("install_ansible.sh")}"

  tags = {
    Name  = "ANSIBLE-Padma-Test${count.index + 1}"
    t_AppID = "SVC01944"
    t_dcl = "2"
    t_cost_centre = "10.695.74172.79943.0000.3"
    t_environment = "DEV"

  }
}
