terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>6.0"
        }
    }
    backend "s3" {
        bucket = "khaleja-remote-state"
        key = "for-remote-demo"
        region = "us-east-1"
        dynamodb_table = "86s-locking"
        
    }      
}

provider "aws" {
    region = "us-east-1"
}
