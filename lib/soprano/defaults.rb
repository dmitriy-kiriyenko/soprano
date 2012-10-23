Capistrano::Configuration.instance(:must_exist).load do
  set :scm, :git
  set :deploy_via, :remote_cache

  set :rails_env, "production"

  role(:app) { host }
  role(:web) { host }
  role(:db, :primary => true) { host }

  set :use_sudo, false

  # Needed for proper password prompts
  default_run_options[:pty] = true

  # SSH options
  ssh_options[:forward_agent] = true
end
