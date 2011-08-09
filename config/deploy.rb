set :application, "foot"
set :repository,  "git@github.com:junkomatsu/foot.git"
set :scm, :git
set :deploy_to, "/var/rails/#{application}"
ssh_options[:forward_agent] = true

set :user, "deploy"
set :use_sudo, false

role :app, "sakura"
role :web, "sakura"
role :db, "sakura", :primary => true

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && BUNDLE_GEMFILE=#{current_path}/Gemfile bundle exec unicorn_rails -c #{current_path}/config/unicorn.rb -E production -D"
  end
 
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "kill -KILL -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
  end
 
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "kill -KILL -s USR2 `cat #{shared_path}/pids/unicorn.pid`"
  end
end