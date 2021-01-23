# EC2

EC2 is probably the most famous AWS service especially between developers. It basically 
provides a IAAS for virtual machines. There are very a lot of details on EC2 to know but 
from developer point of view the basic concepts to know are related to:

- AMI
- EBS/Instance-store EC2 instance
- Instance Type
- Security Groups
- Price model

## AMI
AMI stands for Amazon Machine Images, it is basically all the needed to speedup a new EC2 instance.
It can be composed by:
- one or more Amazon Elastic Block Store (Amazon EBS) snapshots
- one or more instance-store
- permissions about which AWS accounts can use it
- block device mapping that specifies the volumes to attach to the instance when it's launched.

Very important to know is that one AMI give us an ID and it is can be used with Lunch configuration or Lunch template 
for auto scaling. One AMI with Amazon Linux for ARM architecture is different form another due to operative system is 
stored in the root device that as said before is part of AMI definition. Same for region one AMI id referring to AMI in 
eu-central-1 is different to eu-west-1 and so on.


## EBS/Instance-store EC2 instance
One EC2 instance can be EBS or Instance Store based, it depends on instance type, not all instance type can 
benefit from one technology or another. The main difference is how block device are implemented by Amazon. 
[for more details](https://docs.aws.amazon.com/en_us/AWSEC2/latest/UserGuide/Storage.html)

### EBS Based
Basically EBS are remote Block Device and one EC2 even if form user point of view is like a local disk actually
Host and Disk are remote each other, it should be in the same region and Availability Zone of the EC2 connected to.
Another important think to understand is what means EBS optimized. Some EC2 instance type are marked as EBS optimized, 
it means that the EC2 internet network connection, and the EC2 - EBS network connection are not the same, it means that
the throughput and network efficiency are increased and optimized.

### Instance Store
An instance store some time referred as ephemeral storage are special storage attached directly to an EC2 host.  
This storage is located on disks that are physically attached to the host, for this reason  thsi kind of storage has 
the maximum level of performance since that it do not have to go over the network.
However, there are things to be taken in consideration. If the EC2 instance is rebooted 
since that during rebooting the EC2 host will be the same your data will be still in the disk, however is for some reason 
the host fails, the instance is stopped, hibernated or terminated data will be lost.

## Instance Type
Each instance type offers different compute, memory, and storage capabilities. 
Those instance type are grouped in instance families based on these capabilities.
There are many families. Every family give the best balance of resource based on a specific use case. 
The available families are:

- General Purpose
- Compute Optimized
- Memory Optimized
- Storage Optimized
- Accelerated Computing

Pay attention to instance name, an instance like C5 is an Intel instance CPU based, instead a C5a will be a AMD instance CPU based. 
A special talk is for ARM. The A1 family is an ARM instance CPU architecture based, while instance like C6g are 
Graviton2 CPU based that is Arm-based AWS processors

For more details please refers to [this link](https://docs.aws.amazon.com/en_us/AWSEC2/latest/UserGuide/instance-types.html) 
and [this](https://aws.amazon.com/ec2/instance-types/)

## Security Groups
Security Group are Firewall of level 5 on OSI stack for EC2. This Firewall product eve if from dev point of view 
seems to be attached directly to the EC2 instance, it is attached to the ENI (Elastic Network Interface) which in turn is 
attached to an EC2 instance, remember Security Group are attached to an ENI and then an ENI is attached to an EC2. 
It is a level 5 OSI stack firewall and is means that is stateful, remember level 5 is session layer. For this reason 
setting a rules in input even if is not set as output rules all the traffic in inbound then will be allowed to go out 
even no outbound rules is set.

## Price model
As sad before a EC2 instance can be EBS or instance-store based, it can change the overall price model.
Although that, EC2 has an on demand cost, if the disk attached are EBS disk we have to take in account of those disks.
Even if my EC2 instance is stopped it is true that I will not incur in charge of EC2 resource like memory CPU and so on 
since that my instance is stopped adn I'm not using those resources but! since that EBS will be in use from AWS perspective 
due to those EBSs are reserved for your EC2 when we will restart the EC2 I will charge for those EBS. Same think for EIP 
(Elastic IP) nevertheless that I use the EC2 instance in which one EIP is attached or not I will charge for the EIP.

Once that, you have this in mind, we can proceed to explain how EC2 price is calculated in terms of EC2 and not of all the near services 
that are correlated to EC2 but not related to EC2 itself.
The EC2 Instance purchasing options are:

- On-Demand Instances
    - The most expensive purchase option
    - The most flexible purchase option
    - You can benefit of the most, high level abstraction on instance
    - Pay, by the second, for the instances that you launch.
    - Each time you start a stopped instance we charge a minimum of one minute for usage.
      After one minute, we charge only for the seconds you use
      
- Spot Instances
    -  Request unused EC2 instances, which can reduce your Amazon EC2 costs significantly.
    
- Reserved Instances
    - Reduce your Amazon EC2 costs by making a commitment to a consistent instance configuration,
      including instance type and Region, for a term of 1 or 3 years.
    - Reserved Instances are not physical instances, but rather a billing discount applied to the use of On-Demand Instances in your account.
      These On-Demand Instances must match certain attributes, such as instance type and Region,
      in order to benefit from the billing discount.
    - Offering class are:
        - Standard: These provide the most significant discount, but can only be modified. Standard Reserved Instances can't be exchanged.
        - Convertible: These provide a lower discount than Standard Reserved Instances, but can be exchanged for another Convertible Reserved Instance with different instance attributes. 
          Convertible Reserved Instances can also be modified.
    - Payment options are:
      - All Upfront
      - Partial Upfront
      - No Upfront
    
- Savings Plans
    - Reduce your Amazon EC2 costs by making a commitment to a consistent amount of usage, in USD per hour, for a term of 1 or 3 years.
    - For more details [refers to this link](https://docs.aws.amazon.com/savingsplans/latest/userguide/what-is-savings-plans.html)

- Dedicated Hosts
    - Pay for a physical host that is fully dedicated to running your instances, 
      and bring your existing per-socket, per-core, or per-VM software licenses to reduce costs.
    - For more details [refers to this link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html)

- Dedicated Instances
    - Pay, by the hour, for instances that run on single-tenant hardware.
    - For more details [refers to this link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-instance.html)

- Capacity Reservations
    - Reserve capacity for your EC2 instances in a specific Availability Zone for any duration.
    - For more details [refers to this link](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-capacity-reservations.html)
  
[general documentation link](https://docs.aws.amazon.com/en_us/AWSEC2/latest/UserGuide/concepts.html)

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)