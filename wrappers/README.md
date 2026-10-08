# Wrapper for the root module

The configuration in this directory contains an implementation of a single module wrapper pattern, which allows managing several copies of a module in places where using the native Terraform 0.13+ `for_each` feature is not feasible (e.g., with Terragrunt).

You may want to use a single Terragrunt configuration file to manage multiple resources without duplicating `terragrunt.hcl` files for each copy of the same module.

This wrapper does not implement any extra functionality.

## Usage with Terragrunt

`terragrunt.hcl`:

```hcl
terraform {
  source = "tfr:///dsohqlab/random/password//wrappers"
  # Alternative source:
  # source = "git::git@github.com:dsohqlab/terraform-random-password.git//wrappers?ref=master"
}

inputs = {
  items = {
    my-item = {
      # omitted... can be any argument supported by the module
    }
    my-second-item = {
      # omitted... can be any argument supported by the module
    }
    # omitted...
  }
}
```

## Usage with Terraform

```hcl
module "wrapper" {
  source = "dsohqlab/terraform-random-password/aws//wrappers"

  items = {
    my-item = {
      # omitted... can be any argument supported by the module
    }
    my-second-item = {
      # omitted... can be any argument supported by the module
    }
    # omitted...
  }
}
```

## Example: Manage multiple Passwords in one Terragrunt layer

```hcl
terraform {
  source = "tfr:///dsohqlab/password/random//wrappers"
  # Alternative source:
  # source = "git::git@github.com:dsohqlab/terraform-random-password.git//wrappers?ref=master"
}

inputs = {
  defaults = {
    min_upper = 3
  }

  items = {
    password1 = {
      length           = 19
      special          = true
      override_special = "!#$%&*()-_=+[]{}<>:?"
    }
    password2 = {
      length           = 15
      special          = false
    }
  }
}
```
