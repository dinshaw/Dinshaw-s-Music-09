config.cache_classes = false # This must be false for celerity

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = false

# Disable request forgery protection in test environment
config.action_controller.allow_forgery_protection    = false

# Tell Action Mailer not to deliver emails to the real world.
# The :test delivery method accumulates sent emails in the
# ActionMailer::Base.deliveries array.
config.action_mailer.delivery_method = :test

config.gem 'cucumber',    :lib => false
config.gem 'webrat',      :lib => false
config.gem 'rspec',       :lib => false
config.gem 'rspec-rails', :lib => false
config.gem 'notahat-machinist', :lib => 'machinist'
config.gem 'faker'
config.gem 'langalex-culerity', :lib => 'culerity', :source => 'http://gems.github.com'