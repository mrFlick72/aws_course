# AWS ELB

Elastic Load Balancing automatically distributes your incoming traffic across multiple targets, such as EC2 instances,
containers, and IP addresses, in one or more Availability Zones.

It monitors the health of its registered targets, and routes traffic only to the healthy targets. Elastic Load Balancing
scales your load balancer as your incoming traffic changes over time. It can automatically scale to the vast majority of
workloads.

There is three Elastic Load Balancer products in AWS: Application, Network and Classic Load Balancer. Classic Load
Balancer is deprecated and should not used anymore.

Network Load Balancer is a Layer 4 OSI Balancer it is the most performant and is typically used for very high
performance workload, you need to use ports different to 80 or 443, basically a layer 4 OSI balancer is enough for your
use case. Many feature of a NLB are the same of ALB but in this course we will focus on ALB

ALB or Application Load Balancer instead is a full Layer 7 balancer and is the best option when all the power of a layer
7 is required. Since that is a Layer 7 balancer is it is possible configure http or https workload. The basic component
of an ALB are:

- Load balancer
    - it acts as single entry point for your application, it is able to distribute incoming http/https traffic in
      multiple Availability Zones, pay attention at configuration time the minimum number of AZ are 2.
- Listener
    - every listener has one or more rules, it determines how the load balancer routes requests to its registered
      targets. Each rule has a priority, one or more actions, and one or more conditions. In every listener definition
      you must define a default rule.
- Target group
    - Basically you can think to a target group like a container of targets, such as EC2 instances. You can configure
      health checks, those health checks are performed on all targets, in order to decide if a resource is healthy or
      not and if it can accept traffic or not.

Like said before this kind of ELB is a layer 7 OSI stack load balancer this implies that we can expose **ONY** workload
on port 80 (http) or 443 (https), if for some reason we need to expose a load balanced workload on a different port we
need of a **NLB** Network Load Balancer. The ALB is capable to make https termination, apply as many rules as is needed
on a single listener, remember that a listener is attached to a port and considering that ALB is capable to talk only
http and https we can define at most 2 listener one for port 80 and another for port 443. Even if, an ALB is capable to
expose only http/https traffic a target group can ce composed by workloads to port 8080 or any other ports is needed,
will be then via a forward rule that the listener will forward a request on ALB to the target port.

In order to decide if an instance is healthy or not during the **Target Group** definition you have to define the health check

Another very important detail to know about the ELB in general is how it is implemented by Amazon. 
When you create an ALB, AWS will create one ALB node in each enabled AZ. It means that each node will balance the load in the AZ, 
this can create a not uniform load balancing. In order to overcome this problem you have to be care that the **Cross-zone load balancing** 
feature is activated, this feature is by default activated. 

links:

- [introduction](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html)
- [what-is-load-balancing](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/what-is-load-balancing.html)
  

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)