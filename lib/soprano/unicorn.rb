Capistrano::Configuration.instance(:must_exist).load do
  def unicorn_conf
    fetch(:unicorn_conf, "#{current_path}/config/unicorn.rb")
  end

  def unicorn_bin
    fetch(:unicorn_bin, 'bundle exec unicorn')
  end

  def unicorn_pid
    fetch(:unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid")
  end

  namespace :deploy do
    desc "Start application."
    task :start, :roles => :app do
      run "bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
    end

    desc "Stop application."
    task :stop, :roles => :app do
      run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
    end

    desc "Restart application."
    task :restart, :roles => :app do
      run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -HUP `cat #{unicorn_pid}`; else cd #{current_path} && #{unicorn_bin} -c #{unicorn_conf} -E #{rails_env} -D; fi"
    end
  end

  depend :remote, :gem, "passenger", ">=2.2.2"
end
