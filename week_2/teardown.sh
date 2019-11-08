#!/usr/bin/env bash

printf "\n\360\237\221\273\t Destroying EC2 instnace ...\n"
PUBLIC_KEY=`cat id_rsa.pub`
terraform destroy -var "public_key=$PUBLIC_KEY"

printf "\n\360\237\221\273\t Removing public and private keys ...\n"
rm id_rsa*

printf "\n\360\237\221\273\t Purging complete!"
