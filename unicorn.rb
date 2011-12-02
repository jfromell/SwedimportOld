worker_processes 2

working_directory "/home/deployer/rails/current"

listen "/tmp/rails.socket", :backlog => 64
timeout 30

user 'deployer', 'staff'

shared_path = "/home/deployer/rails/shared"
pid = "#{shared_path}/pids/unicorn.pid"

stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"