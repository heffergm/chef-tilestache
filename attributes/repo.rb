#
# Cookbook Name:: tilestache
# Attributes:: repo
#

default[:tilestache][:repo][:use_custom_repo] = false
default[:tilestache][:repo][:shortname]       = 'tilestache_repo'
default[:tilestache][:repo][:longname]        = 'Tilestache Repo'
default[:tilestache][:repo][:baseurl]         = 'http://puppet-n01.staging.us.ccp.rackspace.net/repo_tilestache/'
default[:tilestache][:repo][:enabled]         = 1
default[:tilestache][:repo][:gpgcheck]        = 0
default[:tilestache][:repo][:metadata_expire] = '1m'
