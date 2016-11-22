# packer-template


## vagrantとpackerのインストール

### MacOSX(homebrew)の場合

```
brew install packer
brew cask install virtualbox virtualbox-extension-pack vagrant
```

## CentOS6.8

### CentOS 6.8のイメージを作成する場合

```
cd centos6.8
packer build template.json
```
### 出来上がったboxをvagrantにインポートする

```
vagrant box add centos-6-8-x64 centos-6-8-x64-virtualbox.box
```

### vagrant 起動

```
vagrant init centos-6-8-x64
vagrant up
vagrant ssh
```

## 参考にした情報

```
https://github.com/shiguredo/packer-templates
```


