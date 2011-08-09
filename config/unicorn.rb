$default_env = "production" # デフォルトRailsEnv
$unicorn_user = "deploy" # slaveの実行ユーザ
$unicorn_group = "deploy" # slaveの実行グループ

$dev_processes = 4 # dev環境用子プロセス数
$prod_processes = 16 # 本番環境用子プロセス数

$timeout = 75 # タイムアウト秒数。タイムアウトしたslaveは再起動される

# String => UNIX domain socket / FixNum => TCP socket
#$listen = "/home/bps/tmp/unicorn.sock"
$listen = 8081

# ---- end of config ----

# Main Config for Unicorn
rails_env = ENV['RAILS_ENV'] || $default_env
worker_processes (rails_env == 'production' ? $prod_processes : $dev_processes)
preload_app true
timeout $timeout
listen $listen, :backlog => 2048
pid "tmp/pids/unicorn.pid"
