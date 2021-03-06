set :application, "foot"
set :repository,  "git@github.com:junkomatsu/foot.git"
set :scm, :git
set :deploy_to, "/var/rails/#{application}"
ssh_options[:forward_agent] = true

set :user, "deploy"
set :use_sudo, false

role :app, "sakura2"
role :web, "sakura2"
role :db, "sakura2", :primary => true

set :rails_env, :production
set :unicorn_binary, "/usr/local/bin/unicorn"
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{try_sudo} #{unicorn_binary} -c #{unicorn_config} -E #{rails_env} -D"
  end
 
  task :stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end

  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end

  task :reload, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end

  task :seed do
    run "cd #{current_path} && rake RAILS_ENV=#{rails_env} db:seed"
  end

  desc "Run bundle install"
  task :bundle do
    run "cd #{release_path} && bundle install #{shared_path}/lib"
  end

  after "deploy:update", :roles => :app do
    deploy.bundle
  end
end
