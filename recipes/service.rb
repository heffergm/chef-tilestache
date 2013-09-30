template '/etc/init.d/tilestache' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  source 'tilestache-init.erb'
end

service 'tilestache' do
  supports :start => true, :stop => true, :restart => true
  action [ :enable ]
end
