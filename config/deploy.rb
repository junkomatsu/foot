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
