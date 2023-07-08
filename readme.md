# packer-template

* [check status](check_status.md)

## Description

Packer template for Vagrant base boxes for myself.

* Click here for high-layer-application testing:
  * [docker docs](https://docs.docker.com)
    * [Docker Hub](https://hub.docker.com/search?q=&type=image)
      * [CentOS official Image](https://hub.docker.com/_/centos)
      * [fedora official Image](https://hub.docker.com/_/fedora)
      * [Ubuntu official Image](https://hub.docker.com/_/ubuntu)
  * [Minikube](https://kubernetes.io/docs/tutorials/hello-minikube/)
  * [kubernets](https://kubernetes.io)
* Normal-Users
  * [Vagrant Cloud](https://app.vagrantup.com/boxes/search)
* no-fake rebuild-kernel-work and no-fake network-simulation-work
  * physical device 
* Usage scene
  * Virtual testing.
  * simplified rebuild-kernel-work and simplified network-simulation-work.
  * workflow testing.

## Requirements software

* [macOS BigSur + homebrew + VirtualBox](https://github.com/UmedaTakefumi/packer-templates#macos-bigsur--homebrew--virtualbox)
* [Windows11 Pro + WinGet Client(Windows Package Manager) + VirtualBox](https://github.com/UmedaTakefumi/packer-templates#windows11-pro--winget-clientwindows-package-manager--virtaulbox)
* [Fedora 34 + homebrew + VirtualBox(no-homebrew)](https://github.com/UmedaTakefumi/packer-templates#fedora-34--homebrew--virtualboxno-homebrew)



## Install the required software

### macOS BigSur + homebrew + VirtualBox

* install the homebrew: https://brew.sh

```
brew install virtualbox virtualbox-extension-pack vagrant packer
```

### Windows11 Pro + Chocolatey + VirtaulBox

* install the WinGet Client: https://github.com/microsoft/winget-cli

```
choco install -y virtualbox virtualbox-guest-additions-guest.install
choco install -y vagrant
choco install -y packer
```

### Fedora 34 + homebrew + VirtualBox(no-homebrew)

* install the VirtualBox: https://www.virtualbox.org/wiki/Downloads
* install the Vagrant: https://www.vagrantup.com
* install the homebrew: https://brew.sh

```
wget https://www.virtualbox.org/download/oracle_vbox.asc
sudo rpm --import oracle_vbox.asc
wget https://download.virtualbox.org/virtualbox/6.1.28/VirtualBox-6.1-6.1.28_147628_fedora33-1.x86_64.rpm
sudo yum -y install  VirtualBox-6.1-6.1.28_147628_fedora33-1.x86_64.rpm
sudo yum -y install kernel-devel
sudo /sbin/vboxconfig

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install packer

sudo dnf install -y dnf-plugins-core
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
sudo dnf -y install vagrant
```

## Configration VirtaulBox VirtalMachine

User Variable       | Default Value | Description
--------------------|---------------|----------------------------------------------------------------------------------------
cpus                | 2             | Number of CPUs
memory(RAM)         | 2048          | Memory size in MB

## building Vagrant base boxes

| OS               | CPU-Type | Builders-Type | Flavor                                             |
| ---------------- | -------- | ------------- | -------------------------------------------------- |
| Fedora Server 35 | x86_64   | VirtualBox    | [Fedora-35-server-x86_64](flavor/fedora-35-server-x86_64) |
| Fedora Server 34 | x86_64   | VirtualBox    | [Fedora-34-server-x86_64](flavor/fedora-34-server-x86_64) |
| CentOS 8.2.2004  | x86_64   | VirtualBox    | [CentOS 8.2.2004 x86_64](flavor/centos-8.2.2004-x86_64)   |
| CentOS 7.9       | x86_64   | VirtualBox    | [CentOS 7.9.2009 x86_64](flavor/centos-7.9.2009-x86_64)   |
| CentOS 6.10      | x86_64   | VirtualBox    | [CentOS 6.10 x86_64](flavor/centos-6.10-x86_64)           |
| CentOS 6.10      | i386     | VirtualBox    | [CentOS 6.10 i386](flavor/centos-6.10-i386)               |
| CentOS 6.9       | x86_64   | VirtualBox    | [CentOS 6.9 x86_64](flavor/centos-6.9-x86_64)             |
| CentOS 6.9       | i386     | VirtualBox    | [CentOS 6.9 i386](flavor/centos-6.9-i386)                 |
| CentOS 6.8       | x86_64   | VirtualBox    | [CentOS 6.8 x86_64](flavor/centos-6.8-x86_64)             |
| CentOS 6.8       | i386     | VirtualBox    | [CentOS 6.8 i386](flavor/centos-6.8-i386)                 |
| CentOS 6.7       | x86_64   | VirtualBox    | [CentOS 6.7 x86_64](flavor/centos-6.7-x86_64)             |
| CentOS 6.7       | i386     | VirtualBox    | [CentOS 6.7 i386](flavor/centos-6.7-i386)                 |
| CentOS 6.6       | x86_64   | VirtualBox    | [CentOS 6.6 x86_64](flavor/centos-6.6-x86_64)             |
| CentOS 6.6       | i386     | VirtualBox    | [CentOS 6.6 i386](flavor/centos-6.6-i386)                 |
| CentOS 6.5       | x86_64   | VirtualBox    | [CentOS 6.5 x86_64](flavor/centos-6.5-x86_64)             |
| CentOS 6.5       | i386     | VirtualBox    | [CentOS 6.5 i386](flavor/centos-6.5-i386)                 |
| CentOS 6.4       | x86_64   | VirtualBox    | [CentOS 6.4 x86_64](flavor/centos-6.4-x86_64)             |
| CentOS 6.4       | i386     | VirtualBox    | [CentOS 6.4 i386](flavor/centos-6.4-i386)                 |
| CentOS 6.3       | x86_64   | VirtualBox    | [CentOS 6.3 x86_64](flavor/centos-6.3-x86_64)             |
| CentOS 6.3       | i386     | VirtualBox    | [CentOS 6.3 i386](flavor/centos-6.3-i386)                 |
| CentOS 6.2       | x86_64   | VirtualBox    | [CentOS 6.2 x86_64](flavor/centos-6.2-x86_64)             |
| CentOS 6.2       | i386     | VirtualBox    | [CentOS 6.2 i386](flavor/centos-6.2-i386)                 |
| CentOS 6.1       | x86_64   | VirtualBox    | [CentOS 6.1 x86_64](flavor/centos-6.1-x86_64)             |
| CentOS 6.1       | i386     | VirtualBox    | [CentOS 6.1 i386](flavor/centos-6.1-i386)                 |
| CentOS 6.0       | x86_64   | VirtualBox    | [CentOS 6.0 x86_64](flavor/centos-6.0-x86_64)             |
| CentOS 6.0       | i386     | VirtualBox    | [CentOS 6.0 i386](flavor/centos-6.0-i386)                 |

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
* https://github.com/bobfraser1/packer-alpine
  * Access: 2021-11-06T05:10:00+09:00
  * Title: bobfraser1/packer-alpine: Packer template for alpine linux
* https://github.com/microsoft/winget-pkgs/tree/master/manifests/o/Oracle/VirtualBox
  * Access: 2023-06-14T05:23:00+09:00
  * Title: winget-pkgs/manifests/o/Oracle/VirtualBox at master · microsoft/winget-pkgs
* https://github.com/microsoft/winget-pkgs/tree/master/manifests/h/Hashicorp/Vagrant
  * Access: 2023-06-14T05:23:00+09:00
  * Title: winget-pkgs/manifests/h/Hashicorp/Vagrant at master · microsoft/winget-pkgs
* https://github.com/microsoft/winget-pkgs/tree/master/manifests/h/Hashicorp/Packer
  * Access: 2023-06-14T05:23:00+09:00
  * Title: winget-pkgs/manifests/h/Hashicorp/Packer at master · microsoft/winget-pkgs

## LICENSE

* https://github.com/shiguredo/packer-templates
  * Access: 2023-06-26T12:00:00+09:00
  * Apache License 2.0
* https://github.com/kaorimatz/packer-templates
  * Access: 2023-06-26T12:00:00+09:00
  * MIT License
* https://github.com/hashicorp/packer
  * Access: 2023-06-26T12:00:00+09:00
  * Mozilla Public License 2.0
* https://github.com/joefitzgerald/packer-windows
  * Access: 2023-06-26T12:00:00+09:00
  * MIT License
* https://github.com/chef/bento
  * Access: 2023-06-26T12:00:00+09:00
  * Apache License 2.0
* https://github.com/bobfraser1/packer-alpine    
  * Access: 2023-06-26T12:00:00+09:00
  * Apache License 2.0
* https://github.com/microsoft/winget-pkgs/tree/master
  * Access: 2023-06-26T12:00:00+09:00
  * Apache License 2.0
