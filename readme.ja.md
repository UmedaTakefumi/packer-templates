# packer-template

## Description

Packer template for Vagrant base boxes

* Click here for high-layer-application testing:
  * [docker docs](https://docs.docker.com)
    * [Docker Hub](https://hub.docker.com/search?q=&type=image)
      * [CentOS official Image](https://hub.docker.com/_/centos)
      * [fedora official Image](https://hub.docker.com/_/fedora)
      * [Ubuntu official Image](https://hub.docker.com/_/ubuntu)
  * [Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)
  * [kubernets](https://kubernetes.io)

* Definition here high-layer-application is no-build-kernel-work, no-network-simulation-work.

## Requirements software

* Tests pattern
  * [macOS BigSur + homebrew + VirtualBox](https://github.com/UmedaTakefumi/packer-templates#macos-bigsur--homebrew--virtualbox)
  * [Windows10 Pro + Chocolatey + VirtualBox](https://github.com/UmedaTakefumi/packer-templates#windows10-pro--chocolatey--virtaulbox)
  * [Fedora 34 + homebrew + VirtualBox(no-homebrew)](https://github.com/UmedaTakefumi/packer-templates#fedora-34--homebrew--virtualboxno-homebrew)

## building Vagrant base boxes

* CentOS
  * [CentOS 8.2.2004 x86_64 for VirtualBox](https://github.com/UmedaTakefumi/packer-templates#centos-822004-x86_64-for-virtualbox)
  * [CentOS 7.9.2009 x86_64 for VirtualBox](https://github.com/UmedaTakefumi/packer-templates#centos-792009-x86_64-for-virtualbox)
  * [CentOS 6.2 x86_64](https://github.com/UmedaTakefumi/packer-templates#centos-62-x86_64-for-virtualbox)
  * [CentOS 6.2 i386 for VirtualBox](https://github.com/UmedaTakefumi/packer-templates#centos-62-i386-for-virtualbox)
  * [CentOS 6.1 x86_64 for VirtualBox](https://github.com/UmedaTakefumi/packer-templates#centos-61-x86_64-for-virtualbox)
  * [CentOS 6.1 i386 for VirtualBox](https://github.com/UmedaTakefumi/packer-templates#centos-61-i386-for-virtualbox)
  * [CentOS 6.0 x86_64 for VirtualBox](https://github.com/UmedaTakefumi/packer-templates#centos-60-x86_64-for-virtualbox)
  * [CentOS 6.0 i386 for VirtualBox](https://github.com/UmedaTakefumi/packer-templates#centos-60-i386-for-virtualbox)

## List maintenance of packer template 

* CentOS
  * [CentOS 8.2.2004 x86_64](centos-8.2.2004-x86_64)
  * [CentOS 7.9.2009 x86_64](centos-7.9.2009-x86_64)
  * [CentOS 6.2 x86_64](centos-6.2-x86_64)
  * [CentOS 6.2 i386](centos-6.2-i386)
  * [CentOS 6.1 x86_64](centos-6.1-x86_64)
  * [CentOS 6.1 i386](centos-6.1-i386)
  * [CentOS 6.0 x86_64](centos-6.0-x86_64)
  * [CentOS 6.0 i386](centos-6.0-i386)

### CentOS 8.2.2004 x86_64 for VirtualBox

```
VAGRAND_BOX_NAME=centos-8.2.2004-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 7.9.2009 x86_64 for VirtualBox

```
VAGRAND_BOX_NAME=centos-7.9.2009-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.10 x86_64 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.10-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.3 x86_64 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.3-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.3 i386 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.3-i386

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vgrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```


### CentOS 6.2 x86_64 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.2-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.2 i386 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.2-i386

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.1 x86_64 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.1-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.1 i386 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.1-i386

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.0 x86_64 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.0-x86_64

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

### CentOS 6.0 i386 for VirtualBox

```
VAGRAND_BOX_NAME=centos-6.0-i386

# git clone https://github.com/UmedaTakefumi/packer-templates.git
# cd packer-templates
cd $VAGRAND_BOX_NAME
packer build --only=virtualbox-iso template.json
vagrant box add $VAGRAND_BOX_NAME $VAGRAND_BOX_NAME-virtualbox.box
mkdir -p ~/Vagrant/$VAGRAND_BOX_NAME
cd ~/Vagrant/$VAGRAND_BOX_NAME
vagrant init $VAGRAND_BOX_NAME
```

## Install the required software

### macOS BigSur + homebrew + VirtualBox

* install the homebrew: https://brew.sh

```
brew install virtualbox virtualbox-extension-pack vagrant packer
```

### Windows10 Pro + Chocolatey + VirtaulBox

* install the Chocolatey: https://chocolatey.org

```
choco install virtualbox vagrant packer
```

### Fedora 34 + homebrew + VirtualBox(no-homebrew)

* install the VirtualBox: https://www.virtualbox.org/wiki/Downloads
* install the Vagrant: https://www.vagrantup.com

* install the homebrew: https://brew.sh

```
brew install packer
```


## Configration VirtaulBox VirtalMachine

User Variable       | Default Value | Description
--------------------|---------------|----------------------------------------------------------------------------------------
cpus                | 2             | Number of CPUs
memory(RAM)         | 2048          | Memory size in MB

## Reference

* https://github.com/shiguredo/packer-templates
  * Access: 2021-08-25T12:00:00+09:00
  * Title: shiguredo/packer-templates: This repository has finished updating
* https://github.com/kaorimatz/packer-templates
  * Access: 2021-08-25T12:00:00+09:00
  * Title: kaorimatz/packer-templates: Packer templates for Vagrant base boxes
* https://www.packer.io/docs/templates/index.html
  * Access: 2021-08-25T12:00:00+09:00
  * Title: Templates | Packer by HashiCorp
* https://www.packer.io/docs
  * Access: 2021-08-25T12:00:00+09:00
  * Title: Documentation | Packer by HashiCorp
* https://github.com/joefitzgerald/packer-windows
  * Access: 2021-08-26T05:00:00+09:00
  * Title: joefitzgerald/packer-windows: Windows Packer Templates
* https://github.com/chef/bento
  * Access: 2021-09-03T03:00:00+09:00
  * Title: chef/bento: Packer templates for building minimal Vagrant baseboxes for multiple platforms

