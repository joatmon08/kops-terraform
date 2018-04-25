# kops

## Run
1. Create a PGP key that is a secret and add it to a `.tfvars` file.
   ```
   gpg --export "key name" | base64 > your.tfvars
   ```
1. Make sure your tfvars file has `key=encrypted key` and `region=` defined.
1. `terraform init`
1. `terraform plan -var-file=your.tfvars`
1. `terraform apply -var-file=your.tfvars`
1. Get the Access & Secret Key. To decrypt the secret key:
   ```
   cat secret | base64 -D | gpg -d --
   ```
1. Create the cluster using kops
   ```
   export AWS_ACCESS_KEY_ID=<access key>
   export AWS_SECRET_ACCESS_KEY=<secret key>
   kops create cluster --name=joatmon08.k8s.local --state=s3://joatmon08 --zones=us-west-2a --node-count=2 --node-size=t2.micro --master-size=t2.micro
   kops update cluster joatmon08.k8s.local --yes
   ```