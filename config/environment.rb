require 'bundler/setup'
require 'tty-prompt'
Bundler.require

require_all 'lib'

ActiveRecord::Base.logger = nil