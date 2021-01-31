# AWS Autoscaling

The autoscaling in AWS is a crucial product in order to achieve elasticity, here we are focusing on EC2 autoscaling.
Amazon EC2 Auto Scaling helps you ensure that you have the correct number of Amazon EC2 instances available to handle the load for your application.
The key components are:
- Auto Scaling Group: a collections of EC2 instances, in which you can specify the minimum, maximum and desired number of instances.
  It is possible to use **Auto Scaling Group** together with ALB **Target Group** in order to put instances created by an **Auto Scaling Group** in a **Target Group** 
- Scaling Policies: a set of policies in order to describe how and when enabling a scaling up and down in order to accomplish a desired target.
- Launch Configuration/Template: it defines what is needed to start an EC2 instance. It complains configurations like AMI id, instance type, roles and many more. Basically it should include all the 
  needed configurations to start automatically a fully configured instance by an autoscaling.
  p.s. please use **Launch Template** instead of **Launch Configuration** since that **Launch Configuration** is much less powerful, flexible and more over **Launch Template** is the AWS way 
  I mean AWS strong suggest to use **Launch Template** over **Launch Configuration**.

[more details to this link](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)