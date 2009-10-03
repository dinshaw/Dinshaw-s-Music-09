#
# -- General configuration
#

# cucumber =0.3.98 DON NOT CHANGE
config.gem 'cucumber',    :lib => false,        :version => '=0.3.98'
config.gem 'webrat',      :lib => false,        :version => '>=0.5.0'
config.gem 'rspec',       :lib => false,        :version => '>=1.2.6'
config.gem 'rspec-rails', :lib => false,        :version => '>=1.2.6'

config.gem 'notahat-machinist', :lib => 'machinist'
config.gem 'faker'
config.gem 'langalex-culerity', :lib => 'culerity', :source => 'http://gems.github.com'


config.cache_classes = false
config.whiny_nils = true
config.action_controller.consider_all_requests_local = true
config.action_controller.perform_caching             = true
config.cache_store = :mem_cache_store
config.action_controller.allow_forgery_protection    = false

# Mail
config.action_mailer.perform_deliveries = false
config.action_mailer.delivery_method = :test
config.action_mailer.raise_delivery_errors = true

#
# -- Constants
#

REQUIRE_SSL = false
BASE_DOMAIN = `hostname`.chomp.downcase
AUTHORIZE_IP = '74.217.48.179' # Authorize.Net IP address

DATA_FILE_STORAGE_OPTIONS = { :storage => :filesystem,
  :path => ":rails_root/public/upl/test/data_files/:id_partition/:style/:basename.:extension",
  :url => "/upl/test/data_files/:id_partition/:style/:basename.:extension"}
HEADSHOT_STORAGE_OPTIONS = { :storage => :filesystem,
  :path => ":rails_root/public/upl/test/headshots/:id_partition/:style/:basename.:extension",
  :url => "/upl/test/headshots/:id_partition/:style/:basename.:extension"}
IMPORT_FILE_STORAGE_OPTIONS = { :storage => :filesystem,
  :path => ":rails_root/public/upl/test/imports/:id_partition/:style/:basename.:extension",
  :url => "/upl/test/imports/:id_partition/:style/:basename.:extension"}
LOGO_STORAGE_OPTIONS = { :storage => :filesystem,
  :path => ":rails_root/public/upl/test/logos/:id_partition/:style/:basename.:extension",
  :url => "/upl/test/logos/:id_partition/:style/:basename.:extension"}
STREAM_MESSAGE_STORAGE_OPTIONS = { :storage => :filesystem,
  :path => ":rails_root/public/upl/test/stream_messages/:id_partition/:style/:basename.:extension",
  :url => "/upl/test/stream_messages/:id_partition/:style/:basename.:extension"}

MAILER_HEADERS = {}
FROM_ADDRESSES = {
  'default' => "Bantam (test) <system@bantamlive.com>",
  'notification' => "Bantam (test) <system@bantamlive.com>",
  'reminder' => "Bantam (test) <system@bantamlive.com>",
  'signup' => "Bantam (test) <system@bantamlive.com>",
  'admin' => 'system@bantamlive.com'
}

MAIL_FETCHER_OPTIONS = {
  :batch_size => 100,
  :delete_on_completion => false,
  :mailbox => 'INBOX',
  :overwrite_messages => false,
  :password => 'r0ckst@r',
  :protocol => 'imap',
  :port => '993',
  :server => 'imap.gmail.com',
  :username => 'system@bantam360.com'
}

GOOGLE_ANALYTICS = ''