Abacus Chef Cookbook
===================

Description
-----------
Installs abacus, provides a vagrant environment for iterative testing
* website: https://github.rackspace.com/gran6556/chef-abacus.git

Usage
-----
    include_recipe 'abacus'

Simply include abacus in your run list, or call it from another recipe.

The chef-abacus cookbook is essentially a wrapper around all the dependencies required to get abacus running.

Supported Platforms
-------------------
Tested on CentOS6.{3,4} and Ubuntu12.04LTS. You'll likely be able to get away with other CentOS and Ubuntu releases, but I haven't tested them.

Attributes
----------
### abacus

#### install method
The default method, 'py', will poll git for updates, pull any, re-run setup.py  and bounce services.
The other method available is 'package', which is still a bit of a work in progress. It will set up a yum custom repository,
if so configured,  to poll for updates. The expected RPM is 
largely a convenience, and setup.py is still run to install dependencies. Currently 'package' is only
supported on CentOS, and as a whole, this method isn't terribly well abstracted as yet.
* default: 'py'

#### apache_proxy
Configures Apaache on :80 as a reverse proxy
* default: false

#### filehandle_limit
Ulimit setting for open files permitted to the user configured to run abacus (default: 10240)

#### install_path
Location to clone the abacus git repository to
* default: /opt/abacus

#### repository
Location of the abacus git repository
* default: git//github.rackspace.com/common/abacus.git

#### user
User to run abacus as
* default: abacus

#### user_shell
Shell for your abacus user
* default: /bin/false

#### user_keygen
Whether to generate ssh keys for your abacus user
* default: false

#### group
Group to run abacus as
* default: abacus


### abacus.gunicorn

#### version
Version of gunicorn to install
* default: 17.5
#### backlog
Number of pending requests to allow to queue
* default: 100

#### keepalive
Keepalive request timeout
* default: 60

#### max_requests
Max number of requests a worker will serve before restarting
* default: 100

#### piddir
Location of the gunicorn pid file
* default: /var/run/abacus/gunicorn.pid

#### logdir
Location of the gunicorn log directory
* default: /var/log/abacus

#### logfile
Name of the gunicorn log file
* default: gunicorn.log

#### port
Port to listen on
* default: 8000

#### timeout
Request timeout interval
* default: 300

#### worker_class
Gunicorn worker class
* default: tornado 
* NOTE: not tested with any other classes

#### preload
Preload application code before forking new processes
* default: false

#### workers
Number of workers to spawn
* default: node.cpu.total


### abacus.repo

#### use_custom_repo
Should we set up a custom repository to find the Abacus RPM when used with install_method = package?
* default: false

#### shortname
Name of the repo contained in [], also use for the name of the repo file itself
* default: abacus_repo

#### longname
Name of the repo used in the repo file
* default: 'Abacus Repo'

#### baseurl
Url for the abacus repository
* default: http://puppet-n01.staging.us.ccp.rackspace.net/repo_abacus/

#### gpgcheck
True or false
* default: 0 (false)

#### enabled
Should the repo be enabled
* default: 1 (true)

#### metadata_expire
How often should metadata for this repo be expired
* default: 1m


Dependencies
-----------
* gunicorn, python, ulimit, user


Vagrant Environment
===================

Overview
--------
Want to work on Abacus? Want a sandboxed environment to do it in?

Installation
------------
    vagrant plugin install vagrant-berkshelf 
    bundle install
    berks install
    vagrant up {ubuntu|centos}
    vagrant ssh {ubuntu|centos}

#### What did that just do?
* installed berkshelf, installed our cookbook dependencies, and booted a virtualbox machine
* access the running abacus instance: via http://localhost:8000

#### Multi-box support
* please note that there is currently support for both ubuntu and centos, and that you need to append the correct box name to any commands

#### Where does the abacus cookbook get pulled from
* presently git@github.rackspace.com:gran6556/abacus-chef.git

#### How about the abacus installation itself?
* if you take a gander at the cookbook, you'll see that the the default repository is git@github.rackspace.com:common/abacus.git
* the branch is set depending on the chef environment, if any, defaulting to master in the event there is none

#### How does this help me?
* iteration: hack hack hack on your abacus setup then run `vagrant provision`, which will re-pull the repository and restart abacus

#### I don't like Vagrant
* well then sir, provision a CentOS6 system with the provider of your choice, and then bootstrap with chef-solo:
    `knife solo bootstrap root@${host} -r 'recipe[abacus]'`
* and re-cook with the following:
    `knife solo cook root@${host} -r 'recipe[abacus]'`
* alternatively, you can add the abacus cookbook to your chef server and wrap it as you see fit

Provisos
--------
* only been tested on my laptop!!! (just kidding... mostly)
* for realz, only been tested on CentOS6.{3,4} and Ubuntu12.04LTS

Specs
-----
* `gem install chefspec`
* chefspec needs access to all cookbooks managed by berkshelf, so from chef-abacus/, `rspec spec/spec_helper.rb`
* `rspec spec/some_spec.rb` to run tests

Contributing
------------
Fork, create a feature branch, send a pull! Weeee...

License and Authors
-------------------
Authors: grant.heffernan@rackspace.com(https://github.rackspace.com/gran6556)
