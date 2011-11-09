# Add RVM's lib directory to the load path.
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# Load RVM's capistrano plugin.    
require "rvm/capistrano"

set :rvm_type, :user  # Don't use system-wide RVM
set :use_sudo,            false
#tell git to clone only the latest revision and not the whole repository
set :git_shallow_clone,   1
set :keep_releases,       5
set :application,         "portugon"
set :user,                "nelio"
set :password,            "neliao87"
set :deploy_to,           "/home/nelio/portugon"
set :runner,              "nelio"
set :repository,          "git@github.com:neliojrr/portugon.git"
set :scm,                 :git
 
#options necessary to make Ubuntu’s SSH happy
ssh_options[:paranoid]    = false
default_run_options[:pty] = true
 
role :app, "186.202.45.14"
role :web, "186.202.45.14"
role :db,  "186.202.45.14", :primary => true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
