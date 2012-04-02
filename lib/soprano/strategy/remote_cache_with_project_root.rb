require 'capistrano/recipes/deploy/strategy/remote_cache'

module Soprano
  module Strategy
    class RemoteCacheWithProjectRoot < ::Capistrano::Deploy::Strategy::RemoteCache
      protected

      def copy_repository_cache
        cached_project_root = File.join(repository_cache, project_root)

        logger.trace "copying the cached version from #{cached_project_root} to #{configuration[:release_path]}"

        if copy_exclude.empty?
          run "cp -RPp #{cached_project_root} #{configuration[:release_path]} && #{mark}"
        else
          exclusions = copy_exclude.map { |e| "--exclude=\"#{e}\"" }.join(' ')
          run "rsync -lrpt #{exclusions} #{cached_project_root}/* #{configuration[:release_path]} && #{mark}"
        end
      end
    end
  end
end

Capistrano::Configuration.instance(:must_exist).load do
  on :load do
    unless fetch(:project_root, false)
      raise 'If you require remote_cache_with_project_root, you must provide project root via set :cached_project_root when using this strategy'
    end

    set :strategy, Soprano::Strategy::RemoteCacheWithProjectRoot.new(self)
  end
end
