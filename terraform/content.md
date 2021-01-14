

In order to run terraform you should do the following steps:
- Create a .env file 
- Put .env file a **TERRAFORM_DOCUMENTS_LOCATION**
variable pointing to the path of terraform files that you want runs
- Put .env file all the AWS_* variables in order to configure AWS capabilities
- Uncomment the commands and run one at the time:
    - **init** in order to init terraform plugins
    - **plan** in order to give the possibility to terraform to plan what should do
    - **apply -auto-approve** in order to apply what you want to do
    - **destroy -auto-approve** in order to revert what in apply phase terraform had provisioned