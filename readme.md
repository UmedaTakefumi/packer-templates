# packer-template

## 使い方



### Centos 6.9 x86_64

```
$ cd centos-6.9-x86_64
$ packer build template.json
$ vagrant box add centos-6.9-x86_64 centos-6.9-x86_64-virtualbox.box
$ find . -name *.box -or -name *.iso | xargs -I{} rm {}
```

リポジトリ内の.boxの掃除(一括削除):

```
$ find . -name *.box -or -name *.iso | xargs -I{} rm {}
```

## 参考にした情報

* https://github.com/shiguredo/packer-templates
* https://github.com/kaorimatz/packer-templates
* https://www.packer.io/docs/templates/index.html
