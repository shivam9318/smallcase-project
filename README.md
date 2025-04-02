This project is divided into two main components:

Terraform (Infrastructure as Code)

Application (Flask + Docker)

🛠️ 1. Terraform
Terraform is an IAC (Infrastructure as Code) tool that helps define, create, and manage infrastructure in a safe and repeatable way.

In this project, the Terraform code is organized across 6 files — each serving a specific purpose.

a. main.tf
Defines the core AWS infrastructure:

KMS Key for encrypting EBS volumes

Security Group with configurable inbound (ingress) and outbound (egress) rules

EC2 Instance with:

Encrypted EBS volume attached

Latest Amazon Linux 2 AMI (dynamically fetched via data block)

userdata.sh script to install Docker and prepare the instance

b. variables.tf
Declares all input variables used across the Terraform configuration. It includes:

EC2 instance type

Security group ports and rules

AWS region

Key pair name

c. terraform.tfvars
Defines actual values for variables declared in variables.tf.
If no value is provided elsewhere, Terraform uses these values unless defaults are set.

d. outputs.tf
Outputs the public IP address of the EC2 instance after deployment — useful for testing or SSH access.

e. provider.tf
Specifies the AWS provider configuration, including the region and (optionally) the credentials/profile.

f. userdata.sh
A startup script that:

Installs Docker on the EC2 instance

Enables and starts the Docker service

Adds the default user to the Docker group

🧩 2. Application
The application is a lightweight Flask API, containerized using Docker. It randomly returns a string from a predefined list.

a. app.py
A simple Flask application exposing one endpoint: GET /api/v1

On each request, it returns a random word from:

["Investments", "Smallcase", "Stocks", "buy-the-dip", "TickerTape"]

Uses jsonify() for structured JSON responses

b. Dockerfile
A secure and efficient Dockerfile that:

Uses Python 3.9 slim base image

Creates a non-root user for security

Installs required Python packages

Copies app.py into the container

Exposes the application on port 8081
