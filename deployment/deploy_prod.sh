#!/bin/sh

ssh ubuntu@ip-172-31-31-232 <<EOF
  cd /home/ubuntu/dryz_ecommerce_cicd
  git pull 
  docker-compose up --build -d
  exit
EOF