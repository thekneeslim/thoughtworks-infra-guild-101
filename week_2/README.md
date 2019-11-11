This repository holds configurations and scripts to complete the following:-
* Start an Ubuntu(/ubuntu-xenial-16.04) EC2 instance
* Starts a simple SpringBoot Application on instance creation

## Requirements:
* Terraform needs to be installed on your local
* AWS account created
* AWS credentials have been saved in `~/.aws/credentials`. These credentials will be used to call AWS's API

## Running
To spin up an EC2 instance and run the SpringBoot Application:-
```
./deploy_application_ec2.sh
```

To destory the EC2 instance and purge directory:-
```
./teardown.sh
```

## Debugging:
Upon instance creation, logs will be written to:
```
/var/log/cloud-init-output.log
```

## Terraform console commands
To run `terraform apply` on the console, you will need to provide the public key as an argument:-
```
terraform apply -var "public_key=`cat id_rsa.pub`"
```

## Common Problems

1) When trying to SSH, you get a `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!` warning

  Open up `~/.ssh/known_hosts` and remove the entry pertaining to the same host.

2) `user_data` in `example.tf` is not running

  `EOF` assumes no preceeding whitespaces. If you want to use whitespaces, use this instead:-

  ```
  user_data       = <<-EOF
    #!/usr/bin/env bash
    echo "Installing java ..."
    sudo add-apt-repository ppa:openjdk-r/ppa
    sudo apt-get update
    sudo apt-get -y install openjdk-8-jdk
    echo "Downloading application ..."
    curl -O -L "https://github.com/Thoughtworks-SEA-Capability/Infrastructure-101-Pathway/raw/master/week1/hello-spring-boot-0.1.0.jar"
    echo "Starting application ..."
    java -jar hello-spring-boot-0.1.0.jar
    EOF
  ```

3) Unable to SSH into the box because of "SSH Too Many Authentication Failures” Error

  Add the following parameter `-o IdentitiesOnly=yes` into the ssh script:-

  ```
  ssh -i id_rsa ubuntu@ip.address -o IdentitiesOnly=yes
  ```
