# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem 'haml'
  config.gem 'formtastic'
  config.gem 'authlogic', :version => '>= 2.1.3'
  config.gem 'rpx_now', :version => '>= 0.6.12', :source => 'http://gemcutter.org'
  config.gem 'authlogic_rpx', :version => '>= 1.1.1', :source => 'http://gemcutter.org'
  config.gem 'resource_controller'

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  config.frameworks -= [:active_resource]

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'
end
