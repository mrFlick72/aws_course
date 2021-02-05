# Cloud Front
Basically Cloud Front is the CDN AWS product, it is capable to take advantage of AWS edge location 
and provide a capillary distribution of contents. Behinds the scenes it is used to provide content caching for 
AWS Api-Gateway, S3 acceleration and more.

With CloudFront you can provide CDN service for static content and works seamlessly with 
any AWS origin, like S3, EC2, ELB, any custom HTTP origin. 
You can customize your content delivery through CloudFront using the secure
and programmable edge computing feature AWS Lambda@Edge.

## OAI
When we have S3 as data store for CloudFront sometime we would want that our user go only on CloudFront. 
It can be a desired behavior basically for 2 reason: performance and security. Performance 
due to we want that our customer will benefit of improved performance of CloudFront, for security reason 
because we want in case of signed url on CloudFront that a user do not exploit our security barrier pointing directly on S3.

In order to restrict S3 access only to a CloudFront distribution but in the meanwhile keep public a bucket, in CloudFront 
will be created a "virtual identity" and associate it with your distribution, then is needed to modify S3 bucket policy 
in order to allow only to this "virtual identity" to access to S3, this step using the console is done automatically by CloudFont.
This technic is called OAI or in other words Origin Access Identity

[general documentation](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Introduction.html)

[OAI](https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/private-content-restricting-access-to-s3.html)
[pricing](https://aws.amazon.com/it/cloudfront/pricing/)
[custom-ssl-domains](https://aws.amazon.com/cloudfront/custom-ssl-domains/)

[To the index](https://github.com/mrFlick72/aws_course/blob/main/README.md)