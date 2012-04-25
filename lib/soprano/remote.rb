Capistrano::Configuration.instance(:must_exist).load do
  namespace :remote do
    def get_cmd
      cmd = self[:cmd]
      raise "A command must be given. Please, call the task with -s cmd=\"your command\"" unless cmd
      cmd
    end

    def remote_call(command)
      run wrap_command(command) do |channel, stream, data|
        puts "#{data}"
        break if stream == :err
      end
    end

    def wrap_command(command)
      "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec #{command}"
    end

    desc "execute an arbitrary command from application folder"
    task "command", :roles => :app do
      remote_call get_cmd
    end

    desc "execute an arbitrary rake task from application folder"
    task "rake", :roles => :app do
      remote_call "rake #{get_cmd}"
    end

    desc "execute an arbitrary thor script from application folder"
    task "thor", :roles => :app do
      remote_call "thor #{get_cmd}"
    end

    desc "execute an arbitrary ruby script in application environment"
    task "runner", :roles => :app do
      remote_call "script/rails runner \"#{get_cmd}\""
    end

    desc "tail the application log"
    task :tail, :roles => :app do
      remote_call("tail -n 10000 -f log/#{rails_env}.log")
    end
  end
end
