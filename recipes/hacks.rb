#
# Cookbook Name:: tilestache
# Recipe:: hacks
#
# Copyright 2013, Rackspace
#
# All rights reserved - Do Not Redistribute
#

# hack for VirtualBox
%w(/var/chef /var/chef/cache).each do |d|
  directory d do
    action :create
    owner 'root'
    group 'root'
    mode '0644'
  end
end

