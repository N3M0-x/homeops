terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "Seistrup-Nagel"
    workspaces {
      name = "homeops-cloudflare"
    }
  }
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.0.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.2.1"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.2"
    }
  }
  required_version = ">= 1.3.0"
}

data "sops_file" "secrets" {
  source_file = "secret.sops.yaml"
}
