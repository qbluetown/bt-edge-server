#!/bin/bash
apt install -y mactelnet-server
systemctl disable mactelnet-server
# Create /lib/systemd/system/kiwix.service:
cp kiwix.service /lib/systemd/system/
# Create /lib/systemd/system/mactelnetd.service:
cp mactelnetd.service /lib/systemd/system/
curl -L https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-x86_64.tar.gz |tar -xvz --strip-components=1 --wildcards -f - '*kiwix-serve*'
mkdir /kiwix
cd /kiwix
#Get and extract latest kiwix web server:
mkdir content
#Get some content:
cd content
wget http://download.kiwix.org/zim/wikipedia_en_all_mini.zim
systemctl enable mactelnetd
systemctl start mactelnetd
systemctl enable kiwix
systemctl start kiwix
