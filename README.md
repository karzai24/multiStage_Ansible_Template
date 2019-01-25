# multiStage_Ansible_Template
This is a template for putting together a multi stage Ansible Automation deployment.

Plug in your environment into the inventory files within Development/Staging/Production

Roles are there to make your code easy to plug in.
Look at ansible_template.yml file to see how to add an addtional role to the playbook command

To add functionality just add a new ansible role to the roles folder following the same structure as previous roles
then map your ansilbe_temple.yml file to that role when you wish to execute.

to execute this automation you will need to execute the bash_Ansible_Wrapper.sh with a few parameters like so:
./bash_Ansible_Wrapper.sh -r {{RegionFromInventory}} -e {{Environment}}

You can run this script as a dry run by adding the -t flag at the end (-t stands for test) like so:
./bash_Ansible_Wrapper.sh -r {{RegionFromInventory}} -e {{Environment}} -t
