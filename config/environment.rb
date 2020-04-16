require 'bundler/setup'
require 'tty-prompt'
require 'colorize'
require 'figlet'
Bundler.require

require_all 'lib'

ActiveRecord::Base.logger = nil