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

template "#{node[:tilestach][:cfg_path]}/tilestache.cfg" do
  source 'tilestache.cfg.erb'
  owner 'root'
  group 'root'
  mode 0644
end

include_recipe 'tilestache::apache'
