
provider "aws" {
      region = "us-west-2"
      }
data "aws_ami" "vmworld-demo-latest-ami" {
  most_recent = true

  filter {
    name = "tag:rk_object_name"
    values = ["demo_win"]
  }
}

resource "aws_instance" "vmworld-demo-instance" {
    count = 1  
    ami = "${data.aws_ami.vmworld-demo-latest-ami.id}"
    instance_type = "t2.micro"
    subnet_id = "subnet-0321451998b8cb8c6"
    security_groups = ["sg-04a632cf6fb1ea50d"]
    key_name = "vmworld-mgt371bus-key"
    tags {
        Name = "vmwold-demo-instance"  
        }
}   

output "instance_id" {
  value = "${aws_instance.vmworld-demo-instance.id}"
}