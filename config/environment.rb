# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  SITE_NAME = "DINSHAW"
  ADMINEMAIL = "info@dinshaw.us"
  BASE_DOMAIN = "dinshaw.us"
  
  config.gem "authlogic"
  config.gem 'haml', :lib => 'haml', :version => '>=2.2.16'
  config.gem 'capistrano'
  config.gem 'collectiveidea-delayed_job', :lib => 'delayed_job', :source => 'http://gems.github.com'
  config.gem 'rubyist-aasm', :lib => 'aasm', :source => 'http://gems.github.com'
  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'
  config.gem 'ryanb-acts-as-list', :lib => 'acts_as_list', :source => 'http://gems.github.com'  
  config.gem 'thoughtbot-paperclip', :lib => 'paperclip', :source => 'http://gems.github.com'
  config.gem "adzap-ar_mailer", :lib => 'action_mailer/ar_mailer', :source => 'http://gems.github.com'
  config.gem "friendly_id"
  config.gem 'josevalim-inherited_resources', :lib => 'inherited_resources', :source => 'http://gems.github.com'
  config.gem 'mocha'
  config.gem 'sprockets'
  config.gem 'javan-whenever', :lib => false, :source => 'http://gems.github.com'
  config.gem "RedCloth", :version => ">= 4.2.2", :source => "http://code.whytheluckystiff.net"
  config.gem "ambethia-recaptcha", :lib => "recaptcha/rails", :source => "http://gems.github.com"  
  config.gem "be9-acl9", :source => "http://gems.github.com", :lib => "acl9"  
  config.gem 'compass', :lib => 'compass', :version => '=0.10.0.pre2'
  config.gem "acts-as-taggable-on", :source => "http://gemcutter.org"
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  config.load_paths += %W( #{RAILS_ROOT}/app/sweepers #{RAILS_ROOT}/admin #{RAILS_ROOT}/vendor/gems/RedCloth-4.2.2/ext/redcloth_scan )
  
  # Activate observers that should always be running
  # config.active_record.observers = :gig_sweeper, :cms_page_sweeper, :comment_sweeper, :recording_sweeper, :song_sweeper

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

end

# Haml::Template.options[:format] = :html5