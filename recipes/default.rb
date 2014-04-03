#
# Cookbook Name:: solo-systester
# Recipe:: default
#
# Copyright (C) 2014 Twiket LTD
# 
# All rights reserved - Do Not Redistribute
#

package "sysbench"

bash "ha" do
  code(<<-EOH
    cd /root
    nohup sysbench --num-threads=8 --max-time=14400 --force-shutdown=0 --test=cpu --cpu-max-prime=99999 run > /root/sysbench.cpu 2>&1
  EOH
  )
end
