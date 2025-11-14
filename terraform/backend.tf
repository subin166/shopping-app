terraform {
  backend "s3" {
    bucket = "zomato.kunchirakkattu.com"
    key    = "terraform.tfstate"
    region = "ap-southeast-2"
  }
}
