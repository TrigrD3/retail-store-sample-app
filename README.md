### Technical Test DevOps - IDstar Group

### Terraform

In this test i used AWS and Terraform to create instance, vpc network, and configure security groups.

Pre-requisites:

- aws cli installed locally
- terraform installed locally

After cloning this repository run the following commands:

```shell
cd retail-store-sample-app/terraform-test-idstar

terraform init
terraform plan
terraform apply
```

After the instace has been created and running, access the sample app using on a new browser tab

```shell
http://<Public IP Address>:8888
```

My deployment for this test can be accessed [Here](http://13.250.238.170:8888):

```shell
http://13.250.238.170:8888/
```
