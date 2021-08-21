# packer-template

## Description

Packer template for Vagrant base boxes

## building Vagrant base boxes

### Centos 8.2.2004 x86_64

```
cd centos-8.2.2004-x86_64
packer build template.json
vagrant box add centos-8.2.2004-x86_64 centos-8.2.2004-x86_64-virtualbox.box
```

### Centos 7.9.2009 x86_64

```
cd centos-7.9.2009-x86_64
packer build template.json
vagrant box add centos-7.9.2009-x86_64 centos-7.9.2009-x86_64-virtualbox.box
```

### Centos 6.0 x86_64

```
cd centos-6.0-x86_64
packer build template.json
vagrant box add centos-6.0-x86_64 centos-6.0-x86_64-virtualbox.box
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



## Reference

* https://github.com/shiguredo/packer-templates
* https://github.com/kaorimatz/packer-templates
* https://www.packer.io/docs/templates/index.html
