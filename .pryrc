begin
  require 'hirb'
rescue LoadError
  puts 'no hirb'
end

begin
  require 'awesome_print'
rescue LoadError
  puts 'no awesome_print'
end

prompt_config = lambda {
  colors = {
    white: "\001\e[0m\002",
    red: "\001\e[0;31m\002",
    light_red: "\001\e[1;31m\002"
  }
  Pry.config.prompt = proc do |obj, _nest_level, _pry_|
    version = ''
    version << colors[:red] << "[Ruby:#{RUBY_VERSION}]" << colors[:white]
    version << colors[:light_red] << "[Rails:#{Rails.version}]" << colors[:white] if defined?(Rails)
    "#{version} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
  end
}

hirb_config = lambda {
  Hirb::View.instance_eval do
    def enable_output_method
      @output_method = true
      @old_print = Pry.config.print
      Pry.config.print = proc do |*args|
        Hirb::View.view_or_page_output(args[1]) || @old_print.call(*args)
      end
    end

    def disable_output_method
      Pry.config.print = @old_print
      @output_method = nil
    end
  end
  Hirb.enable
}

awesome_print_config = lambda {
  AwesomePrint.pry!
}

byebug_config = lambda {
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'c', 'continue'
}

Pry::Commands.command(/^$/, 'repeat last command') do
  _pry_.run_command Pry.history.to_a.last
end

prompt_config.call
byebug_config.call if defined?(PryByebug)
awesome_print_config.call if defined?(AwesomePrint)
hirb_config.call if defined?(Hirb)
