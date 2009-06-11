# Application
set :application, "lorrainelubner"
set :deploy_to, "/home/banditbill/lorrainelubner"

# Settings
set :use_sudo, false

# Server

role :app, "lorrainelubner.com"
role :web, "lorrainelubner.com"
role :db,  "lorrainelubner.com", :primary => true
set :user, "banditbill"
set :use_sudo, false

# Git

set :scm, :git
set :repository, "git@github.com:ssbothwell/lorrainelubner.com.git"
set :scm_username, "ssbothwell"
set :scm_passphrase, "haskard"
ssh_options[:paranoid] = false
default_run_options[:pty] = true

# Passenger

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"