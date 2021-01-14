# Terraform

Terraform is a popular Hashicorp Open Source Tool that helps teams to apply infrastructure as code in order to provide a 
consistent CLI workflow to manage hundreds of cloud services. 

Basically it is capable to apply and destroy infrastructure in a state-full nad declarative fashion, describing what 
you want in a file written in a declarative language used by terraform in order to understand what you want from the system.

The very basic and essential to know  key components are:
- **Backend**: It is a key component that define how and where the state is stored and loaded, by default it is possible 
  to avails to local and remote providers like git or S3. Backends are completely optional and in this course
  will be not used. 
  For more details about backends, please refer to [this link](https://www.terraform.io/docs/backends/index.html)
- **Variables**: This as the name suggest are variables used to make your terraform documents customizable 
- **Provider**: Basically "providers" are the plugins that make possible to terraform of interacts with remote systems.
  Each provider adds a set of resource types and/or data sources that Terraform can manage.
  For more details about you can refer to [this link](https://www.terraform.io/docs/configuration/blocks/providers/index.html)

- **Datasource**: Datasource are terraform abstractions that make possible via providers to collect data of a system in which some provider acts.
  For more details about you can refer to [this link](https://www.terraform.io/docs/configuration/data-sources.html)
- **Resource**: Resources are terraform abstractions that make possible via providers to create in apply phase or 
  destroy in destroy phase resources like S3 Bucket a RabbitMQ Exchange and so on.... of a system in which some provider acts
  For more details about you can refer to [this link](https://www.terraform.io/docs/configuration/blocks/resources/index.html)


# Use a dockerized terraform installation

In order to run terraform you should do the following steps:
- Create a .env file 
- Put .env file a **TERRAFORM_DOCUMENTS_LOCATION**
variable pointing to the path of terraform files that you want runs
- Put .env file all the **AWS_*** variables in order to configure AWS capabilities
- Uncomment the commands and run one at the time:
    - **init** in order to init terraform plugins
    - **plan** in order to give the possibility to terraform to plan what should do
    - **apply -auto-approve** in order to apply what you want to do
    - **destroy -auto-approve** in order to revert what in apply phase terraform had provisioned
  
After that all the configuration in .env file are applied you can run the ``` docker-compose up ``` command 