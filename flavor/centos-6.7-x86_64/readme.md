# CentOS 6.7 x86_64 for VirtualBox

## procedure

```
VAGRAND_BOX_NAME=centos-6.7-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

