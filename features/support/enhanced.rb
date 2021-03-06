ENV["RAILS_ENV"] = "cucumber_enhanced"

require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
# this causes the cacheclasses warrning but is needed for paths to laod properly
require 'cucumber/rails/world'
require 'machinist/active_record'
require 'sham'
require 'faker'
require 'culerity'

require File.expand_path(File.join(File.dirname(__FILE__), "/../../test/blueprints.rb"))

# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'


Before do
  $server ||= Culerity::run_server
  $browser = Culerity::RemoteBrowserProxy.new $server, {
    :browser => :firefox,
    :javascript_exceptions => false,
    :log_level => :severe,
    :resynchronize => true
  }
  @host = 'http://localhost:3001'
end

at_exit do
  $browser.exit if $browser
  $server.exit_server if $server
  %w(User).each do |class_name|
    class_name.constantize.delete_all
  end
end
