This repository holds configurations and scripts to complete the following:-
* Start an Ubuntu() EC2 instance
* Starts a simple SpringBoot Application on instance creation

Requirements:
* Terraform
* AWS account

Assumptions:
* AWS credentials will be used from `~/.aws/credentials`

Debugging:
Upon instance creation, logs will be written to:
```
/var/log/cloud-init-output.log
```
