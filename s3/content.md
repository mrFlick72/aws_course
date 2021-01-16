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
## S3 security model

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)