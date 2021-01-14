

In order to run terraform create a .env file and put in **TERRAFORM_DOCUMENTS_LOCATION** 
variable the path of terraform files that you want run 
then uncomment the commands and run one at the time:
- **init** in order to init terraform plugins
- **plan** in order to give the possibility to terraform to plan what should do
- **apply -auto-approve** in order to apply what you want to do
- **destroy -auto-approve** in order to revert what in apply phase terraform had provisioned