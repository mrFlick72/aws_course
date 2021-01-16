# S3
S3 stand for Simple Storage Service. It is one of the oldest AWS product, as the name can suggest it is a storage product.
It is one of the cheapest storage product in AWS very flexible in terms of features:
- Object storage
- Storage for a Cloud Front distribution
    - CloudFront is the CDN product in AWS
- Logs storage for almost all if not all the products that requires logs in AWS
- Flexible price model 
- Extremely flexible security policy
- Used as storage backend for many products like Elastic Transfer, EMR, DevOps AWS products and many more

As said before it is an Object Storage for this reason it is suitable when it is needed to store single files it is not suitable 
to be used as a mounted disk in EC2 instance, but on the other hands it is largely used as snapshot storage for EC2, RDS and many other product snapshot.

The files stored can be very huge, S3 support up to 5TB per file, it can be used as backend for logs CDN source storage, snapshots store and many more. 
Especially with big files one strategy to speed up the upload process involves to use the **Multipart upload**. 
This feature divide a file in chunk and make possible the upload process in parallel, it has the advantage to use more that one 
connection and upload more that one part of the file in parallel and be more resilient in case of connectivity failure
since that the failure will not involve all the upload but only the failed part.   

Another weapon to speed up the performance is use the transfer accelerator, basically it uses edge AWS infrastructure that is 
much more spread around the world, the same used for  CloudFront’s globally distributed edge locations,
it makes near to user the contents speeding up the overall performance.    

S3 support versioning, it is required if you want enables cross Region replication, pay attention once versioning is enabled it can not be disabled, it can be only suspended, 
another thing to know is about deletions, with versioning enabled any deletion actually is applied a deletion marker. 

Another very cool feature is the possibility to use S3 as a static web server in order to serve static html page, web asset, video, audio and so on.

## S3 storage class
S3 offer 4 types of "storage class": 
- **S3 Standard**
- **S3 Intelligent-Tiering** 
- **S3 Standard IA**
- **S3 One-Zone-IA** 
- **S3 Glacier**
- **S3 Glacier Deep Archive** 

Basically based on which storage class you choose you get more availability and durability. 

The first class **S3 Standard** is thought to be the most expensive but in the meanwhile the most available and durable,
with this class you will get your content replicated to at least 3 Availability Zone.

The **S3 Standard IA** class is though for content that has infrequent access, the price in this case is cheaper, the 
durability is the same, but you have per GB retrieval fees, minimal storage duration of 30 days and minimal billable object size of 128Kb.

The **S3 One-Zone-IA** instead is cheaper of **S3 Standard IA** it is thought for infrequent access and less durable storage. 
With this class your content is not replicated across multiple Availability Zones. 
As **S3 Standard IA** ou have per GB retrieval fees, minimal storage duration of 30 days and minimal billable object size of 128Kb.

**S3 Intelligent-Tiering** is an intelligent storage class capable to understand the object storage and adjust the storage classification. 
It is basically High available the storage is replicated across at least 3 Availability Zones, has a minimal storage duration of 30 days,
no minimal billable object size but monitoring and automation fees per object apply. No retrieval fees.

In any case yes before you read that right **S3 Intelligent-Tiering** is capable to "adjust the storage class configuration".
In S3 is possible change the storage class of a bucket those process is called **Object lifecycle management**.
Basically it is possible to manage the lifecycle and define policy to move data from a storage class to another or expire objects 
in order to save money for stale objects. 
Pay attention it is to configure even for version if versioning is enabled.

**S3 Glacier** and **S3 Glacier Deep Archive** are the cheapest S3 storage class in AWS, but are thought for backup storage.
Those are highly durable but with very slow retrieval time with fees to applied for retrieval, 
Glassier has a minimal duration time of 90 days with a minimal billable object size of 40k,
while Glassier Deep Archive has a minimal duration time of 180 days with a minimal billable object size of 40k.
For both archive you must first restore archived objects before you can access them

## S3 security model
S3 security feature are very flexible and allows you to define exactly what you can do with an object, there are two main way to achieve security in S3:
- **ACL** but are deprecated, and usage is discouraged by AWS 
- **Bucket Policy** a json document that describe permissions to a bucket similar to the policy in IAM

## S3 Advanced features: Events
Every action to a bucket of object can fire an events that can be consumed by application to do something. 
The possible destination that an application can subscribe on to consume this event are SNS or SQS. 
SNS is a pub sub notification product in AWS, while SQS is one of the very first if not the very first messaging product in AWS. 
Moreover, an event can fire the execution of a Lambda, of course I'm talking of the serverless product in AWS ;)

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)