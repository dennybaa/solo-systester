#
# Cookbook Name:: solo-systester
# Recipe:: default
#
# Copyright (C) 2014 Twiket LTD
# 
# All rights reserved - Do Not Redistribute
#

url = 'http://downloads.sourceforge.net/project/systester/systester/1.5.0/systester-1.5.1-linux-amd64.tar.gz?r=http%3A%2F%2Fsystester.sourceforge.net%2Fdownloads.php&ts=1396513529'

remote_file '/root/systester.tar.gz' do
  source url
end

bash do
  code<<-EOH
    cd /root
    test -d systester-* || tar xzf systester.tar.gz
    cd systester-*
    nohup systester-cli -threads 16 -turns 30000 -log
  EOH
end
