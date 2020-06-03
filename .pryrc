require "benchmark"
require "json"
require "yaml"

colors = {
  white: "\001\e[0m\002",
  red: "\001\e[0;31m\002",
  light_red: "\001\e[1;31m\002"
}

pry_prompt = proc do |obj, _nest_level, _pry_|
  version = ''
  version << colors[:red] << "[Ruby:#{RUBY_VERSION}]" << colors[:white]
  if defined?(Rails)
    version << colors[:light_red] << "[Rails:#{Rails.version}]" << colors[:white]
  end
  "#{version} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
end

if !Pry::Prompt.const_defined?(:MAP)
  pry_prompt = Pry::Prompt.new(
    "with_versions",
    "prompt with versions",
    [pry_prompt]
  )
end

Pry.config.prompt = pry_prompt
Pry::Commands.command(/^$/, 'repeat last command') do
  _pry_.run_command Pry.history.to_a.last
end

if defined?(PryByebug)
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'c', 'continue'
end
