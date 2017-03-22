# README #

### 概要 ###

サーバ構成管理ソース

### require ###
* ruby
* itamae

### target server ###
* Ubuntu16.04

### how to execute ###

例としてAWS EC2を想定する

* 秘密鍵: <<SECKEY>>
* パブリックDNS: <<AWSDNS>>

in itamae server
```
#!zsh

bundle insatll --path=vendor/bundle
bundle exec itamae ssh -u ubuntu -h <<AWSDNS>> -i <<SECKEY>> main.rb
ssh ubuntu@<<AWSDNS>> -i <<SECKEY>>
```

in web server

```
#!zsh

mkdir lazarus
cd lazarus
git clone https://github.com/srpg-lazarus/portal.git
ln -s /home/ubuntu/lazarus/portal /var/www/lazarus-portal

git clone https://github.com/srpg-lazarus/node-test.git

```

その後、lazarus-portal,lazarus-node-testのreadmeを参考にセットアップを行う
