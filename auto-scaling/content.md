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

An Auto Scaling group starts by launching enough instances to meet its desired capacity, instances that can launch On-Demand Instances, Spot Instances, or both.
An Auto Scaling group maintains the number of instances by performing periodic health checks on the instances in the group.
If an instance becomes unhealthy, the group terminates the unhealthy instance and launches another instance to replace it.
If a scaling action occurs, Amazon EC2 Auto Scaling automatically maintains balance across all of the Availability Zones that you specify.

The default health checks for an Auto Scaling group are EC2 status checks only. 
To ensure that your Auto Scaling group can determine an instance's health based on additional tests provided by the load balancer,
you can configure the Auto Scaling group to use Elastic Load Balancing (ELB) health checks. The load balancer periodically sends pings, 
attempts connections, or sends requests to test the EC2 instances and determines if an instance is unhealthy.
If you configure the Auto Scaling group to use ELB health checks, it considers the instance unhealthy if it fails either the EC2 status checks or the ELB health checks.

## How to scale
In Autoscaling Group there are 2 man way to scale:
- manually: basically you can set via web console or api the desired state and then will be the responsibility of autoscaling to accomplish the desired state
- dynamically:
  - Target tracking scaling—Increase or decrease the current capacity of the group based on a target value for a specific metric.
  - Step scaling—Increase or decrease the current capacity of the group based on a set of scaling adjustments, known as step adjustments, that vary based on the size of the alarm breach.
  - Simple scaling—Increase or decrease the current capacity of the group based on a single scaling adjustment. 

On top of those two strategy we can have those scaling options:
- Maintain current instance levels at all times: 
  - You can configure your Auto Scaling group to maintain a specified number of running instances at all times.
- Scale manually
- Scale based on a schedule
  - Scaling by schedule means that scaling actions are performed automatically as a function of time and date
- Scale based on demand
  - A more advanced way to scale your resources, using scaling policies like described above under dynamic scaling 

Take in account that all Dynamic autoscaling will involve CloudWatch metrics that will trigger an autoscaling event. 
Between one scale up or down event within a time window called scaling cooldowns. 
This is needed to prevent an hysterical scale up and down of instance that can cause a significant cost increasing 
[more details to this link](https://docs.aws.amazon.com/autoscaling/ec2/userguide/what-is-amazon-ec2-auto-scaling.html)

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)