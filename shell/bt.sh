#!/bin/bash
yum -y install expect
bash <(curl -sSL 'https://raw.githubusercontent.com/dou-blog/blog/refs/heads/master/shell/bt/1.sh')
expect <(curl -sSL 'https://raw.githubusercontent.com/dou-blog/blog/refs/heads/master/shell/bt/btsetup')

