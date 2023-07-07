source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.2"

gem 'bootstrap'
gem "bootsnap", require: false
gem 'font-awesome-sass', '~> 6.4.0'
gem 'haml'
gem 'httparty'
gem "importmap-rails"
gem "jbuilder"
gem 'jquery-rails'
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem 'rack-cors'
gem 'sass-rails'
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem 'jwt'
gem 'devise-jwt'
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'devise'
gem 'active_model_serializers', '~> 0.10.2'
gem 'jsonapi-serializer'


group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "html2haml"
  gem "haml-rails"
  gem 'rspec-rails'
  gem 'rubocop', require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
