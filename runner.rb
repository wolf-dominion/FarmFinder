#!/usr/bin/env ruby
require_relative 'config/environment'


Cli.new(User.new()).welcome_message
