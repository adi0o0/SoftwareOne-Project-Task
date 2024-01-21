#!/bin/bash

# Install apache
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service

#Install mySQL client
dnf -y localinstall https://dev.mysql.com/get/mysql80-community-release-el9-4.noarch.rpm
dnf upgrade --releasever=2023.3.20240117
dnf -y install mysql mysql-community-client

# Install NFS
yum -y install nfs-utils

# Mount EFS
mkdir ~/efs
mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${efs-dns-name}:/  ~/efs
chmod go+rw .

## Attention - Did not have enough time to automatically mount the fstab