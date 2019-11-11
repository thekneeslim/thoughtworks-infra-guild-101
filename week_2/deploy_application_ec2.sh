#!/usr/bin/env bash

set -e

printf "\n\360\237\221\273\t Initializing Terraform working directory ...\n"
terraform init

printf "\n\360\237\221\273\t Generating public private key pair ...\n"
ssh-keygen -t rsa -b 4096 -C "abcd1234@email.com" -N '' -f ./id_rsa

printf "\n\360\237\221\273\t Spinning up EC2 instance to run application ...\n"
PUBLIC_KEY=`cat id_rsa.pub`
terraform apply -var "public_key=$PUBLIC_KEY"

PUBLIC_IP=`terraform output ip`
printf "\n\360\237\221\273\t EC2 instance running on $PUBLIC_IP ...\n"

printf "\n\360\237\221\273\t Information:\n\n"

cat <<EOF
Your EC2 instnace is currently installing java and various dependencies. To view the logs, ssh into the box:
1) ssh -i id_rsa ubuntu@$PUBLIC_IP
2) tail -f /var/log/cloud-init-output.log

After your instance has been provisioned with dependencies installed, you will be able to hit the application on http://${PUBLIC_IP}:8080
EOF

printf "\n\360\237\221\273\t Happy learning!!!\n"
