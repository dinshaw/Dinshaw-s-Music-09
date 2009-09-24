# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  SITE_NAME = "DINSHAW"
  ADMINEMAIL = "info@dinshaw.us"
  
  # config.gem 'openrain-action_mailer_tls', :lib => 'smtp_tls.rb', :source => 'http://gems.github.com'
  config.gem 'chriseppstein-compass', :lib => 'compass', :source => 'http://gems.github.com/'
  config.gem 'haml', :lib => 'haml'
  config.gem 'capistrano'
  # config.gem 'ruby-openid', :lib => 'openid'
  config.gem 'rubyist-aasm', :lib => 'aasm', :source => 'http://gems.github.com'
  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
  # config.gem 'prawn', :source => 'http://gems.github.com'
  config.gem 'chronic', :source => 'http://gems.github.com'
  # config.gem 'RedCloth'
  config.gem 'ryanb-acts-as-list', :lib => 'acts_as_list', :source => 'http://gems.github.com'  
  # config.gem 'hpricot', :source => 'http://code.whytheluckystiff.net'
  # config.gem 'sqlite3-ruby', :lib => 'sqlite3'
  config.gem "friendly_id"
  config.gem 'thoughtbot-paperclip', :lib => 'paperclip', :source => 'http://gems.github.com'
  config.gem "ar_mailer", :lib => 'action_mailer/ar_mailer', :source => 'http://gems.github.com'  
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  config.load_paths += %W( #{RAILS_ROOT}/admin #{RAILS_ROOT}/vendor/gems/RedCloth-4.1.9/ext/redcloth_scan)
  
  # Activate observers that should always be running
  config.active_record.observers = :user_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

end