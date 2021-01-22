# EC2

EC2 is probably the most famous AWS service especially between developers. It basically 
provides a IAAS for virtual machines. There are very a lot of details on EC2 to know but 
from developer point of view the basic concepts to know are related to:

- AMI
- EBS/Instance-store EC2 instance
- Instance Type
- Security Groups
- Price model
- Launch Template

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



[general documentation link](https://docs.aws.amazon.com/en_us/AWSEC2/latest/UserGuide/concepts.html)

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)