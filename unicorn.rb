worker_processes 4
working_directory "/home/deployer/swedimport/current"

listen "/tmp/swedimport.socket", :backlog => 64

timeout 30

user 'deployer', 'staff'

shared_path = "/home/deployer/swedimport/shared"
pid = "#{shared_path}/log/unicorn.pid"
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"