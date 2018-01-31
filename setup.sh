#!/bin/bash

#
# EC2を立ち上げた時いつも流すスクリプト
#

# 基本設定
#
## yumを最新に
sudo yum -y update

## timezone設定
sudo unalias cp
sudo cp -f -p /usr/share/zoneinfo/Japan /etc/localtime
sudo cp /dev/null /etc/sysconfig/clock
echo -e 'ZONE=\"Asia/Tokyo\"\nUTC=false' | sudo tee -a /etc/sysconfig/clock
sudo chmod 644 /etc/sysconfig/clock
sudo /etc/init.d/crond restart

## 日本語設定
sudo cp /dev/null /etc/sysconfig/i18n
echo 'LANG=ja_JP.UTF-8' | sudo tee -a /etc/sysconfig/i18n