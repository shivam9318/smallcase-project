This Application is Divided into 2 Components:
1. terraform
2. application

1. **Terraform.**

Terraform is IAC tool that help us to maintain and create infrastructure related to our services.
In the Terraform section there are 6 files in total, each one has its own role.

a. **main.tf** file - In main.tf,  I have created few AWS services that were needed as a part of assignment,
   - kms_key for ebs encryption
   - security group with inbound and outbound rules defined
   - AWS EC2 Instance with ebs volume attached with encryption
   - We are also calling userdata.sh file for installing the necessary packages.
   - A data source is also created to fetch latest ami based on the requirement that we have mentioned in the ami part, it will fetch the ami based on our filter

b. **variable.tf** file - In variable.tf , I have defined the variables for the resources that we are going to create, Here Variables are defined for the below mentioned resources.
   - EC2
   - Security Group(Egress,Ingress Rules)
   - provider file also

c. **terraform.tfvars** - This file contains the value that we have set in variable.tf, variable.tf has default value only if we do nott provide variable by any other method it will pick the default value

d. **output.tf** - In output.tf we are returning the value of public IP of EC2 Instance

e. **provider.tf** -  Here We are providing the detail and profile for the aws provider

f. **userdata.sh** - This is the file for userdata that will be used in the EC2 Server and will launch docker.

2. **appliaction**

In the application part we have app.py where we are creating a flash application that will generate a random value based on the set of the strings.
In the application part we also have a Dockerfile that will be creating a docker container with application code and will expose it in the port 8081

a.**app.py**
  This code is using flask for creating an api /api/v1 which will use GET method to get the random string based on the list of strings. It will use random() function present in python and will use jsonify for response processing.

b. **Dockerfile**
  We have created a secure dockerfile where we are downloading python3.9  and creating a non-root user for building the image, we are copying the app.py into the image and then at last that application is being exposed at port 8081

I have Tested that application using curl localhost:8081/api/v1 and have got the desired output of randomstring












  
