#Overview
This project creates an [AWS](http://aws.amazon.com/) environment suitable for testing 
the EC2 Container Registry offering.  To get things working, it is going to require 
the use of multiple tools including Terraform and the AWS CLI.

#Prerequisites

* [Terraform](https://terraform.io/) installed and working
* Development and testing was done on [Ubuntu Linux](http://www.ubuntu.com/)
* [SSH](http://www.openssh.com/) installed and working
* The environment variable `AWS_ACCESS_KEY_ID` set to your AWS Access Key ID 
* The environment variable `AWS_SECRET_ACCESS_KEY` set to your AWS Secret Access Key
* The environment variable `AWS_REGION` set to AWS region to the region you will be working in. 
* An existing [AWS SSH Key Pair](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)

#Building
This project is a collection of data files consumed by Terraform and Ansible so there is nothing to build. 

#Installation
* follow the instructions in the `terraform/README.md` file to create the necessary AWS infrastructure
  
#Tips and Tricks
See the *Tips and Tricks* section of each sub-project. 

#Troubleshooting
See the *Troubleshooting* section of each sub-project. 

#License and Credits
This project operates under Apache open source license.

#List of Changes
