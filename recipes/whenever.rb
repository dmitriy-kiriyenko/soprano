namespace :soprano do
  namespace :whenever do
    desc <<-DESC
      Update the crontab file with whenever.
    DESC
    task :update_crontab, :roles => :db do
      whenever_command = fetch(:whenever_command, "whenever")
      run "cd #{release_path} && #{whenever_command} --set environment=#{rails_env} --update-crontab #{deploy_to}"
    end
  end
end

on :load do
  if fetch(:whenever, false)
    after "deploy:symlink", "soprano:whenever:update_crontab"
  end
end
