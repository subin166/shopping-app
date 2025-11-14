packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}
source "amazon-ebs" "ami" {
  ami_name      = local.image_name
  instance_type = var.instance_type
  region        = var.aws_region
  ssh_username  = "ec2-user"
  source_ami    = var.ami_id
  tags = {
    Name        = "${local.image_name}"
    Project     = "${var.project_name}"
    Environment = "${var.project_environment}"
  }
}

build {
  sources = ["source.amazon-ebs.ami"]

  provisioner "file" {
    source    = "../website"
    destination = "/tmp/"
  }
  provisioner "shell" {
    script          = "setup.sh"
    execute_command = "sudo {{ .Path }}"
  }

}
