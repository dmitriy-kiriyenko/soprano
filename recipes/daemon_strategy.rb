on :load do
  strategy = fetch(:daemon_strategy, nil)

  if strategy && [:passenger, :mongrel_cluster].include?(strategy)
    puts "Providing strategy via set :daemon_strategy, #{strategy} is deprecated!"
    puts "Use require 'servers/#{strategy}' instead."

    load File.join(File.dirname(__FILE__), "servers", "#{strategy}.rb")
  end
end
