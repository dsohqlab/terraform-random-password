terraform {
  required_version = ">= 1.11.1"

  required_providers {
    kubernetes = {
      source  = "hashicorp/random"
      version = ">= 3.9"
    }
  }
}
