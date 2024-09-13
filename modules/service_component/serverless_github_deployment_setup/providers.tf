# Note:  Due to the github provider having an old source of hashicorp/github and a new source of integrations/github,
# if the required provider is not specified in this module, terraform will use the old provider (hashicorp/github).  
# Use of the old provider will cause failures, so the required_provider and provider blocks must remain here, 
# until this issue is resolved.

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.7"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}
