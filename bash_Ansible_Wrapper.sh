# This Shell Wrapper will be used to pass the Ansible Playboook command Variables based on which environment you wish to deploy too.
#!/usr/bin/bash

usage="Please provide parameters for Enviroment/Region Please refer to README.md"
user=$(whoami)
while getopts "r:e:t" options; do
  case $options in
    r) region=$OPTARG;;
    e) environment=$OPTARG;;   
    t) optional=" --check";;
    \? ) echo $usage
         exit 1;;
    * ) echo $usage
          exit 1;;
  esac
done

if [[ -z $region || -z $environment ]]; then
  echo 'One or more mandatory variables are undefined'
  echo $usage
  exit 1
fi

echo "Environment: $environment"
echo "Region: $region"
echo "Optional tags: $optional"
echo "User: $user"
echo "Control Machine: $HOSTNAME"

cd ansible && ansible-playbook -i $environment -e Environment=$environment -e Service=$service -e Region=$region  ansible_template.yml $optional
