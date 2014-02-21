#
# Cookbook Name:: irc
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user "tdi_irc" do
  comment "sample chef user"
  home "/home/tdi_irc"
  password "$1$gV3qbbJz$5iSHjcpE767owIbkCcsIi/"
  manage_home true
  shell "/bin/bash"

  action :create
end

package "irssi" do
  action :install
end

directory '/home/tdi_irc/.irssi' do
  mode '0755'
  owner 'tdi_irc'
  group 'tdi_irc'

  action :create
end

cookbook_file '/home/tdi_irc/.irssi/config' do
  source 'irssi-config'
  owner 'tdi_irc'
  group 'tdi_irc'
  mode 00644
end
