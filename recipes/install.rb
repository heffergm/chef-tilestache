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

#bash 'tilestache_setup_py' do
#  action :nothing
#  user 'root'
#  group 'root'
#  cwd "#{node[:tilestache][:install_path]}"
#  code <<-EOH
#    #{node[:python][:binary]} setup.py install
#  EOH
#end

#git "#{node[:tilestache][:install_path]}" do
#  action :sync
#  repository "#{node[:tilestache][:repository]}"
#  revision   "#{node[:tilestache][:revision]}"
#  user       "#{node[:tilestache][:user]}"
#  group      "#{node[:tilestache][:group]}"
#  notifies :restart, 'service[tilestache]', :delayed
#  notifies :run, 'bash[tilestache_setup_py]', :immediately
#end

include_recipe 'tilestache::apache'
