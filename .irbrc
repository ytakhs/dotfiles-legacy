# frozen_string_literal: true

require 'irb/completion'
require 'irb/save-history'

IRB.conf.save_history = true
IRB.conf.history_file = File.expand_path(File.join(ENV['HOME'], '.irb_history'))

if defined? Pry
  begin
    require 'rails/console/app'
    require 'rails/console/helpers'

    TOPLEVEL_BINDING.eval('self').extend ::Rails::ConsoleMethods
  rescue LoadError
    puts 'No Rails'
  end

  Pry.start
  exit
end
