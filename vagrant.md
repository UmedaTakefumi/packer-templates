## vagrantとpackerのインストール

### MacOSX(homebrew)の場合

```
brew install packer
brew cask install virtualbox virtualbox-extension-pack vagrant
```

### vagrant 起動

```
vagrant init centos-6-8-x64
vagrant up
vagrant ssh
```