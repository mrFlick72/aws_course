In order to put all together as first step you need a certificate in us-east-1 region, this is 
required for CloudFront SSL capability in order to register an alias on Route53.

After that the certificate is created you will need to create a CNAME entry in Route53 for certificate issue 
validation. In order to do that you can go on AWS ACM product page and click on your certificate entry 
expand domain section and click on **Create Record on Route 53** that will take care for create the required 
CNAME DNS entry for you.

Wait that certificate is on Issue state and apply, terraform apply -auto-approve command under put-all-together.