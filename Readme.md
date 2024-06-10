# Docker and Codepipeline Deployment with AWS CloudFormation

This project demonstrates how to deploy an EC2 instance with Docker installed using AWS CloudFormation. It also includes configurations to add the `ec2-user` to the Docker group and attach the AWS CodeDeploy IAM role to the instance.

## Prerequisites

- AWS CLI installed and configured
- An existing EC2 Key Pair
- An existing VPC
- An exsting Subnet within the VPC
- Necessary AWS IAM permissions to create CloudFormation stacks, IAM roles, EC2 instances, and security groups

## CloudFormation Template

### Description

This CloudFormation template performs the following tasks:

1. Creates an IAM role and attaches the `AmazonEC2RoleforAWSCodeDeploy` managed policy.
2. Creates an instance profile for the IAM role.
3. Launches an EC2 instance with the specified instance type and Amazon Linux 2 AMI.
4. Configures Docker and Nginx to be installed, enabled, and started.
5. Adds the `ec2-user` to the Docker group.

### Parameters

- `VpcId`: Id of an existing EC2 VPC to provision instance in.
- `SubnetId`: Id of an existing EC2 Subnet to provision instance in.
- `KeyName`: Name of an existing EC2 KeyPair to enable access to the instance.
- `ImageId`: Id of EC2 Image id.
- `InstanceType`: Name of EC2 Instance type.

### Resources

- **IAM Role (`EC2Role`)**: Allows EC2 to assume the role and access AWS CodeDeploy.
- **Instance Profile (`EC2InstanceProfile`)**: Associates the IAM role with the EC2 instance.
- **EC2 Instance (`Instance`)**: The main instance where Docker and Nginx are installed.
- **Security Group (`InstanceSecurityGroup`)**: Allows connection to all port on tcp (not vaible for production).

### Installation and Setup

1. Save the CloudFormation template as `cnt_template.yaml`.

2. Deploy the template using AWS Console:


3. Monitor the stack creation process in the AWS Management Console or using AWS CLI:
    ```sh
    aws cloudformation describe-stacks --stack-name <stackName>
    ```

### Verifying the Installation

1. SSH into the EC2 instance using the key pair specified:
    ```sh
    ssh -i your_key_name.pem ec2-user@<PUBLIC_IP>
    ```

2. Check that Docker and Nginx are installed and running:
    ```sh
    docker --version
    nginx -v
    sudo service docker status
    sudo service nginx status
    ```

3. Ensure `ec2-user` is part of the Docker group:
    ```sh
    groups ec2-user
    ```

### Troubleshooting

- **Log Files**: Check the CloudFormation logs on the EC2 instance for troubleshooting:
    ```sh
    sudo cat /var/log/cfn-init.log
    sudo cat /var/log/cfn-init-cmd.log
    ```

- **User Data Logs**: Check the user data script output:
    ```sh
    sudo cat /var/log/cloud-init-output.log
    ```

### Clean Up

Delete the stack using AWS Management Console or using AWS CLI:
```sh
aws cloudformation delete-stack --stack-name <stackName>
```