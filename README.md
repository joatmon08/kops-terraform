# kops

## Run
1. Create a PGP key that is a secret and add it to a `.tfvars` file.
   ```
   gpg --export "key name" | base64 > your.tfvars
   ```
1. Make sure your tfvars file has `key=encrypted key` and `region=` defined.
1. `terraform init`
1. `terraform plan`
1. `terraform apply -var-file=rosemary.tfvars`
1. Get the Access & Secret Key. To decrypt the secret key:
   ```
   cat secret | base64 -D | gpg -d --
   ```
1. 