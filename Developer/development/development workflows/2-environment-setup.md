# Environment Setup

![Environment Setup](https://sennalabs.s3.ap-southeast-1.amazonaws.com/Screenshot+2566-06-13+at+17.29.28.png)

---
## ECS environment setup

Amazon Elastic Container Service (ECS) is a scalable container orchestration service provided by Amazon Web Services (AWS). It allows developers to deploy and manage containers easily and efficiently. This guide will walk you through the process of setting up an ECS environment step by step.

## Prerequisites
Before you begin, make sure you have the following prerequisites in place:

1. An AWS account with appropriate permissions to create resources like ECS clusters, IAM roles, and EC2 instances.
2. AWS Command Line Interface (CLI) installed and configured with access keys for your AWS account.
3. Basic knowledge of Docker and container concepts.

# Steps

1. Create a new ECR repository.
2. Create a new ECS cluster.
3. Clone the existing NestJS repository.
4. Create new environments on GitHub.
5. Create a GitHub deployment action.
 
---

## Step 1: Create an ECR repository

1. Log in to your AWS account and navigate to the ECR console.
2. Click on "Create repository" to start creating a new ECR repository.
3. Choose the visibility settings either (private or public).
4. Enter the repository name.
5. Click on "Create repository" to create a new one.

## Step 2: Create an ECS Cluster

1. Log in to your AWS account and navigate to the ECS console.
2. Click on "Create Cluster" to start creating a new ECS cluster.
3. Choose a cluster template that suits your requirements. The "EC2 Linux + Networking" template is a good starting point.
4. Configure the cluster details, including a name for your cluster, VPC (Virtual Private Cloud), and subnets.
5. Adjust the cluster settings as needed, such as instance type, key pair for SSH access, and the number of instances.

## Step 3: Create a Task Definition

1. In the ECS console, navigate to the "Task Definitions" section and click on "Create new Task Definition."
2. Choose the launch type compatibility (EC2 or Fargate) depending on your cluster setup.
3. Configure your task definition, including the container image, CPU and memory requirements, port mappings, environment variables, and logging settings.
4. Under the "Task Role" section, select "Choose an existing IAM role" and provide the ARN of the IAM role you created earlier.

## Step 4: Register Task Definition with ECS Service

1. After creating the task definition, go back to the "Clusters" section of the ECS console and click on your cluster's name.
2. In the cluster details, select the "Services" tab and click on "Create."
3. Configure your service, including the launch type, task definition family and revision (choose the one you created), desired number of tasks, and the load balancer settings if needed.
4. Review your settings and click on "Create Service" to deploy your tasks.

---
