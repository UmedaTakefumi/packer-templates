# packer-template

## Description

Packer template for Vagrant base boxes

* Click here for high-layer-application testing:
  * [docker docs](https://docs.docker.com)
  * [Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)
  * [kubernets](https://kubernetes.io)

* Definition here high-layer-application is no-build-kernel-work, no-network-simulation-work.

## Requirements software

* [macOS BigSur + homebrew + VirtualBox](https://github.com/UmedaTakefumi/packer-templates#macos-bigsur--homebrew--virtualbox)


## building Vagrant base boxes

* CentOS
  * [CentOS 8.2.2004 x86_64](https://github.com/UmedaTakefumi/packer-templates#centos-822004-x86_64)
  * [CentOS 7.9.2009 x86_64](https://github.com/UmedaTakefumi/packer-templates#centos-792009-x86_64)
  * [CentOS 6.1 x86_64](https://github.com/UmedaTakefumi/packer-templates#centos-61-x86_64)
  * [CentOS 6.1 i386](https://github.com/UmedaTakefumi/packer-templates#centos-61-i386)
  * [CentOS 6.0 x86_64](https://github.com/UmedaTakefumi/packer-templates#centos-60-x86_64)
  * [CentOS 6.0 i386](https://github.com/UmedaTakefumi/packer-templates#centos-60-i386)

## List maintenance of packer template 

* CentOS
  * [CentOS 8.2.2004 x86_64](centos-8.2.2004-x86_64)
  * [CentOS 7.9.2009 x86_64](centos-7.9.2009-x86_64)
  * [CentOS 6.1 x86_64](centos-6.1-x86_64)
  * [CentOS 6.1 i386](centos-6.1-i386)
  * [CentOS 6.0 x86_64](centos-6.0-x86_64)
  * [CentOS 6.0 i386](centos-6.0-i386)

### CentOS 8.2.2004 x86_64

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

### CentOS 7.9.2009 x86_64

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

### CentOS 6.1 x86_64

```
VAGRAND_BOX_NAME=centos-6.1-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
cd ~/Vgrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.1 i386

```
VAGRAND_BOX_NAME=centos-6.1-i386

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
cd ~/Vgrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.0 x86_64

```
VAGRAND_BOX_NAME=centos-6.0-x86_64(macOS BigSur, VirtualBox)

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build  --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
cd ~/Vgrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.0 i386(macOS BigSur, VirtualBox)

```
VAGRAND_BOX_NAME=centos-6.0-i386

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
cd ~/Vgrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

## Cleanup repository

```
$ find . -name *.box -or -name *.iso | xargs -I{} rm {}
```

## Install the required software

### macOS BigSur + homebrew + VirtualBox

* install the homebrew: https://brew.sh

```
brew install vagrant virtualbox packer
```

## Configration VirtaulBox VirtalMachine

User Variable       | Default Value | Description
--------------------|---------------|----------------------------------------------------------------------------------------
cpus                | 2             | Number of CPUs
memory(RAM)         | 2048          | Memory size in MB

## Reference

* https://github.com/shiguredo/packer-templates
* https://github.com/kaorimatz/packer-templates
* https://www.packer.io/docs/templates/index.html
* https://www.packer.io/docs
