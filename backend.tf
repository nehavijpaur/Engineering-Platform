terraform {
  backend "s3" {
    bucket         = "devlake-terraform-state"        
    key            = "devlake/terraform.tfstate"   
    region         = "ap-south-1"                     
    encrypt        = true    
    dynamodb_table = "devlake-terraform-locks"     
    acl            = "bucket-owner-full-control"                  
  }
}
