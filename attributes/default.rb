# tilestache
default[:tilestache][:filehandle_limit] = 20480
default[:tilestache][:install_path]     = '/opt/tilestache'
default[:tilestache][:build_path]       = '/var/lib/tilestache'
default[:tilestache][:repository]       = 'http://github.com/migurski/TileStache'
default[:tilestache][:user]             = 'tilestache'
default[:tilestache][:group]            = 'tilestache'
default[:tilestache][:user_shell]       = '/bin/false'
default[:tilestache][:user_keygen]      = false
default[:tilestache][:apache_proxy]     = false

# python
default[:python][:install_method] = 'package'
