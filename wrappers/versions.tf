terraform {
  required_version = ">= 1.11.1"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.9"
    }
  }
}
