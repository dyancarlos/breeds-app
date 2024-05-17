source 'https://rubygems.org'

ruby '3.2.0'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.3'
gem 'sassc-rails'
gem 'importmap-rails'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem "sqlite3", "~> 1.4"

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rspec-rails', '~> 6.0.2'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webmock'
end

group :tools do
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end
