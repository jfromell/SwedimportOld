set :use_sudo,            false

set :scm,                 :git
set :git_shallow_clone,   1
set :keep_releases,       3
set :repository,          "git@github.com:JonasFromell/Swedimport.git"

set :application,         "swedimport"

set :user,                "deployer"
set :password,            "8w2u7757"

set :deploy_to,           "/home/deployer/swedimport"

set :runner,              "deployer"

set :real_revision,       lambda { source.query_revision(revision) { |cmd| capture(cmd) } }

role :app,                "31.192.226.123"
role :web,                "31.192.226.123"
role :db,                 "31.192.226.123", :primary => true

ssh_options[:paranoid]    = false
default_run_options[:pty] =true

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