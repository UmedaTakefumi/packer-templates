# packer-template

## 使い方

リポジトリクローン:

```
$ git clone https://github.com/UmedaTakefumi/packer-templates.git && cd packer-templates
```

イメージを作成する場合(CentOS):

```
$ cd centos-6.9-x86_64
$ packer build template.json
```

vagrantにインポート:

```
$ vagrant box add centos-6.9-x86_64 centos-6.9-x86_64-virtualbox.box
```

リポジトリ内の.boxの掃除(一括削除):

```
$ find . -name *.box -exec rm {} \;
```

## 参考にした情報

```
https://github.com/shiguredo/packer-templates
https://github.com/kaorimatz/packer-templates
https://www.packer.io/docs/templates/index.html
```
