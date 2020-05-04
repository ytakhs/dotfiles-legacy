# frozen_string_literal: true

require 'irb/completion'
require 'irb/save-history'

IRB.conf.save_history = true
IRB.conf.history_file = File.expand_path(File.join(ENV['HOME'], '.irb_history'))
