# IAM

IAM stands for Identity Access Managements. 
It is basically a set of products for Identity and Access management inside AWS services.

It is a free service that helps you securely control access to AWS resources. 
You use IAM to control who is authenticated (signed in) and authorized (has permissions) 
to use resources. 

The Base concepts of IAM are:
- user
- group
- role
- policy

A **User**, as world can suggest, is an AWS user capable to access to web console and or to access to CLI. 
By default, any new created user do not have any permission.
A **Policy** is a set of permission that can be attached to an identity, or a resource.
An identity-based policies are basically JSON documents that control what actions an identity like users, groups  and roles.
Those policies can be **Managed policies** like AWS managed policies or Customer managed policies: Standalone identity-based policies 
that you can attach to multiple identities or **Inline policies**, Policies that you add directly to a single identity.
A **Group** is a logical entity used to group user.
A **Role** instead is perhaps one of the most important type of identity in AWS.
A Role basically is an entity that connect trusted identity to permissions. 
Basically trusted identity are identity allowed to assume a role that will guarantee some permissions (policies).
The very good think about role are: assuming a role the trusted identity will gain some temporary credentials via STS product: Secure Token Service.
It enables to gain access to AWS resources from trusted user of another account, 
users coming from identity provider via SAML2 or OpenIdConnect protocols 
and more important Roles permits to AWS service to use api of other services, think to Lambda.
A Lambda function can access to AWS resources like S3, DynamoDB and much more via Role and STS. 

Another advantage of role is about user IAM had limits to 5000 users per AWS account.

[general documentation link](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html) 