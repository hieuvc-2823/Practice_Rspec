source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.7.0"

gem "active_storage_validations", "0.8.2"
gem "bcrypt", "3.1.13"
gem "bootsnap", ">= 1.4.4", require: false
gem "bootstrap-sass", "3.4.1"
gem "bootstrap-will_paginate", "1.0.0"
gem "config"
gem "faker", "2.1.2"
gem "i18n-js"
gem "image_processing", "1.9.3"
gem "mysql2", "~> 0.5.2"
gem "jbuilder", "~> 2.7"
gem "jquery-rails", "4.3.1"
gem "mini_magick", "4.9.5"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.3"
gem "rails-i18n"
gem "sass-rails", ">= 6"
gem "sqlite3", "~> 1.4"
gem "simplecov-rcov"
gem "simplecov"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"
gem "will_paginate", "3.1.8"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rails-controller-testing"
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main'
  end
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
