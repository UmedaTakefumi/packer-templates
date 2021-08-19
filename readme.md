# packer-template

## Description

Packer template for Vagrant base boxes

## building Vagrant base boxes

### centos-8.2.2004-x86_64

```
$ cd centos-8.2.2004-x86_64
$ packer build template.json
$ vagrant box add centos-8.2.2004-x86_64 centos-8.2.2004-x86_64-virtualbox.box
```

### Centos 6.9 x86_64

```
$ cd centos-6.9-x86_64
$ packer build template.json
$ vagrant box add centos-6.9-x86_64 centos-6.9-x86_64-virtualbox.box
```


## Cleanup repository

```
$ find . -name *.box -or -name *.iso | xargs -I{} rm {}
```

## Reference

* https://github.com/shiguredo/packer-templates
* https://github.com/kaorimatz/packer-templates
* https://www.packer.io/docs/templates/index.html
