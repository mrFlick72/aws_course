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

An Auto Scaling group starts by launching enough instances to meet its desired capacity.
An Auto Scaling group can launch On-Demand Instances, Spot Instances, or both.
It maintains this number of instances by performing periodic health checks on the instances in the group.
If an instance becomes unhealthy, the group terminates the unhealthy instance and launches another instance to replace it.
When instances are launched, if you specified multiple Availability Zones, the desired capacity is distributed across these Availability Zones.
If a scaling action occurs, Amazon EC2 Auto Scaling automatically maintains balance across all of the Availability Zones that you specify.
The default health checks for an Auto Scaling group are EC2 status checks only. If an instance fails these status checks, 
it is marked unhealthy and will be terminated while Amazon EC2 Auto Scaling launches a new instance in replacement.
To ensure that your Auto Scaling group can determine an instance's health based on additional tests provided by the load balancer,
you can configure the Auto Scaling group to use Elastic Load Balancing (ELB) health checks. The load balancer periodically sends pings, 
attempts connections, or sends requests to test the EC2 instances and determines if an instance is unhealthy.
If you configure the Auto Scaling group to use ELB health checks, it considers the instance unhealthy if it fails either the EC2 status checks or the ELB health checks.


[more details to this link](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)