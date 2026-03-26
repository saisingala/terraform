terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6"
    }
  }

  backend "s3" {
    bucket = "khaleja-remote-state"
    key = "remote-state-demo" #use unique names, if we keep all state files all at once it will be complicated
    region = "us-east-1"
    dynamodb_table = "86s-locking"

  }
}

provider "aws" {
  region = "us-east-1"
}