# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "cucumber_plain"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require 'machinist/active_record'
require 'sham'
require 'faker'
require File.expand_path(File.join(File.dirname(__FILE__), "/../../test/blueprints.rb"))


