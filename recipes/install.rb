#
# Cookbook Name:: tilestache
# Recipe:: install
#
# Copyright 2013, Mapzen
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'tilestache::service'
include_recipe 'tilestache::gunicorn'

python_pip 'tilestache' do
  action :install
  version "#{node[:tilestache][:version]}"
end

template "#{node[:tilestache][:cfg_path]}/tilestache.cfg" do
  source 'tilestache.cfg.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :restart, 'service[tilestache]', :delayed
end

include_recipe 'tilestache::apache'
