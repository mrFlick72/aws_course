# AWS ELB
Elastic Load Balancing automatically distributes your incoming traffic across multiple targets, 
such as EC2 instances, containers, and IP addresses, in one or more Availability Zones. 

It monitors the health of its registered targets, and routes traffic only to the healthy targets.
Elastic Load Balancing scales your load balancer as your incoming traffic changes over time. 
It can automatically scale to the vast majority of workloads.

There is three Elastic Load Balancer products in AWS: Application, Network and Classic Load Balancer.
Classic Load Balancer is deprecated and should not used anymore. 

Network Load Balancer is a Layer 4 OSI Balancer it is the most performant and is typically used for very 
high performance workload, you need to use ports different to 80 or 443, basically a layer 4 OSI balancer is enough for 
your use case. Many feature of a NLB are the same of ALB but in this course we will focus on ALB

ALB or Application Load Balancer instead is a full Layer 7 balancer and is the best option when all the power of a layer 7 is required. 
Since that is a Layer 7 balancer is it is possible configure http or https workload. 
The basic component of an ALB are:
- Load balancer
    - it acts as single entry point for your application, it is able to distribute incoming  http/https traffic
      in multiple Availability Zones, pay attention at configuration time the minimum number of AZ are 2.
- Listener
    - every listener has one or more rules, it determines how the load balancer routes requests to its registered targets.
      Each rule has a priority, one or more actions, and one or more conditions.
      In every listener definition you must define a default rule.
- Target group
    - Basically you can think to a target group like a container of targets, such as EC2 instances.
      You can configure health checks, those health checks are performed on all targets, in order to 
      decide if a resource is healthy or not and if it can accept traffic or not.


https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/what-is-load-balancing.html
https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html
[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)