# load 'deploy/assets'

set :use_sudo,              false

set :git_shallow_clone,     false

set :keep_releases,         3

set :application,           "swedimport"

set :user,                  "deployer"

set :password,              "8w2u7757"

set :deploy_to,             "/home/deployer/swedimport"

set :runner,                "deployer"

set :repository,            "git@github.com:JonasFromell/swedimport.git"
set :scm,                   :git
set :real_revision,         lambda { source.query_revision(revision) { |cmd| capture(cmd) } }

ssh_options[:paranoid]      = false
default_run_options[:pty]   = true

role :app,                  "31.192.226.123"
role :web,                  "31.192.226.123"
role :db,                   "31.192.226.123", :primary => true

namespace :deploy do
  task :start do
    sudo "/etc/init.d/unicorn start"
  end
  task :stop do
    sudo "/etc/init.d/unicorn stop"
  end
  task :restart do
    sudo "/etc/init.d/unicorn reload"
  end
end