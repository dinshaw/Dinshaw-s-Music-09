# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "cucumber"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

require 'cucumber/rails/rspec'
require 'cucumber/rails/world'
require 'webrat/core/matchers'
require 'machinist/active_record'
require 'sham'
require 'faker'
require File.expand_path(File.join(File.dirname(__FILE__), "/../../test/blueprints.rb"))

# Comment out the next line if you don't want Cucumber Unicode support
# require 'cucumber/formatter/unicode'

# Comment out the next line if you want Rails' own error handling
# (e.g. rescue_action_in_public / rescue_responses / rescue_from)
# Cucumber::Rails.bypass_rescue

require 'webrat'
require 'cucumber/webrat/element_locator' # Lets you do table.diff!(element_at('#my_table_or_dl_or_ul_or_ol').to_table)

Webrat.configure do |config|
  config.mode = :rails
end


