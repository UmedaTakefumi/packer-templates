# packer-template

## Description

Packer template for Vagrant base boxes

* Click here for high-layer-application testing:
  * [docker docs](https://docs.docker.com)
  * [Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)
  * [kubernets](https://kubernetes.io)

## building Vagrant base boxes

* CentOS
  * [CentOS 8.2.2004 x86_64](https://github.com/UmedaTakefumi/packer-templates#centos-822004-x86_64)
  * [CentOS 7.9.2009 x86_64](https://github.com/UmedaTakefumi/packer-templates#centos-792009-x86_64)
  * [CentOS 6.0 x86_64](https://github.com/UmedaTakefumi/packer-templates#centos-60-x86_64)

### Centos 8.2.2004 x86_64

```
VAGRAND_BOX_NAME=centos-8.2.2004-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
cd ~/Vgrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### Centos 7.9.2009 x86_64

```
VAGRAND_BOX_NAME=centos-7.9.2009-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
cd ~/Vgrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### Centos 6.0 x86_64

```
VAGRAND_BOX_NAME=centos-6.0-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
cd ~/Vgrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

## Cleanup repository

```
$ find . -name *.box -or -name *.iso | xargs -I{} rm {}
```

## Configration VirtaulBox VirtalMachine

User Variable       | Default Value | Description
--------------------|---------------|----------------------------------------------------------------------------------------
cpus                | 2             | Number of CPUs
memory(RAM)         | 2048          | Memory size in MB

## List maintenance of packer template 

* CentOS
  * [CentOS 8.2.2004 x86_64](centos-8.2.2004-x86_64)
  * [CentOs 7.9.2009 x86_64](centos-7.9.2009-x86_64)
  * [CentOs 6.0 x86_64](centos-6.0-x86_64)

## Reference

* https://github.com/shiguredo/packer-templates
* https://github.com/kaorimatz/packer-templates
* https://www.packer.io/docs/templates/index.html
