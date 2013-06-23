Capistrano::Configuration.instance(:must_exist).load do

  def puma_sock
    fetch :puma_sock, "unix://#{File.join([shared_path, "puma.sock"])}"
  end

  def puma_conf
    fetch :puma_conf, File.join([shared_path, "config", "puma.rb"])
  end

  def puma_pid
    fetch :puma_pid, File.join([shared_path, "pids", "puma.pid"])
  end

  def puma_state
    fetch :puma_state, File.join([shared_path, "puma.state"])
  end

  namespace :deploy do
    desc "Start application."
    task :start, :roles => :app do
      run "service puma start #{application}"
    end

    desc "Stop application."
    task :stop, :roles => :app do
      run "service puma stop #{application}"
    end

    desc "Restart application."
    task :restart, :roles => :app do
      run "service puma restart #{application}"
    end

    desc "Creating config for application"
    task :init_config, :roles => :app do
      db_config = ERB.new <<-EOF
environment "production"

threads 2,2

bind "#{puma_sock}"
pidfile "#{puma_pid}"
state_path "#{puma_state}"

activate_control_app
      EOF

      run "mkdir -p #{File.dirname(puma_pid)}"
      put db_config.result, puma_conf
    end

  end

  on :load do
    if fetch(:create_puma_config, false)
      before "deploy:setup", "deploy:init_config"
    end
  end


end
