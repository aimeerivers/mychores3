source 'http://rubygems.org'

gem 'rails', '3.0.0'

gem 'haml', '>=3.0.0'
gem 'formtastic', '1.1.0.beta'
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'
gem 'rpx_now', '>= 0.6.12'
gem 'authlogic_rpx', '>= 1.1.1'

gem 'mysql'

group :cucumber do
  gem 'capybara', '>= 0.3.0'
  gem 'database_cleaner', '>= 0.5.0'
  gem 'cucumber-rails', '>= 0.3.0'
  gem 'cucumber', '0.8.5'
  gem 'rspec-rails', '>= 2.0.0.beta.20'
  gem 'spork'
  gem 'launchy'    # So you can do Then show me the page
end

group :test, :development do
  gem 'rspec-rails', '>= 2.0.0.beta.20'
end

group :test do
  gem 'factory_girl_rails'
  gem 'webrat'
end

group :development do
  gem 'mongrel'
  gem 'fastercsv'
end

