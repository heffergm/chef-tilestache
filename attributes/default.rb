# tilestache
default[:tilestache][:version]          = '1.49.8'
default[:tilestache][:filehandle_limit] = 20480
default[:tilestache][:install_path]     = '/opt/tilestache'
default[:tilestache][:cfg_path]         = "#{node[:tilestache][:install_path]}/conf"
default[:tilestache][:cfg_template]     = "tilestache.cfg.erb"
default[:tilestache][:user]             = 'tilestache'
default[:tilestache][:group]            = 'tilestache'
default[:tilestache][:user_shell]       = '/bin/false'
default[:tilestache][:user_keygen]      = false
default[:tilestache][:apache_proxy]     = false

# python
default[:python][:install_method] = 'package'
