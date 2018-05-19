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
    The output of the apply will have an access key and the GPG encrypted
    secret key.
1. Get the Access & Secret Key. To decrypt the secret key:
   ```
   echo <secret> | base64 -D | gpg -d --
   ```
1. Create the cluster using kops
   ```
   export AWS_ACCESS_KEY_ID=<access key>
   export AWS_SECRET_ACCESS_KEY=<secret key>
   export KOPS_STATE_STORE=s3://<your s3 bucket>
   kops create cluster \
    --name=<your cluster name>.k8s.local --zones=us-west-2a \
    --node-count=2 --node-size=t2.micro \
    --master-size=t2.micro --kubernetes-version 1.9.4
   kops update cluster <your cluster name>.k8s.local --yes
   ```