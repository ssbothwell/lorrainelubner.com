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
ssh_options[:paranoid] = false
default_run_options[:pty] = true

# Passenger Integration

namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared configs and folders on each release."  
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/db/production.sqlite3 #{release_path}/db/production.sqlite3"    
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"    
  end
  
  desc "Sync the public/assets directory."
  task :assets do
    system "rsync -vr --exclude='.DS_Store' public/assets #{user}@thetis.dreamhost.com:#{shared_path}/"
    system "rsync -vr --exclude='.DS_Store' db/production.sqlite3 #{user}@thetis.dreamhost.com:#{shared_path}/"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'