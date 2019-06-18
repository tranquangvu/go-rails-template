source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.1'

# Server
gem 'rails', '~> 5.2.3'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false

# Database and Model
gem 'pg'
gem 'aasm'
gem 'value_objects', git: 'https://github.com/GoldenOwlAsia/value_objects.git'

# Asset pipeline
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 1.3.0'

# View render
gem 'slim'
gem 'simple_form'
gem 'country_select'
gem 'kaminari'

# Pdf render
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# Xlsx render
# gem 'axlsx', git: 'https://github.com/randym/axlsx.git'
# gem 'axlsx_rails'

# Mailer
gem 'premailer-rails'

# Front-end
gem 'turbolinks', '~> 5'
gem 'sprockets', '>= 3.0.0'
gem 'sprockets-es6'
gem 'punchbox', git: 'https://github.com/GoldenOwlAsia/punchbox.git'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'

# File uploading
gem 'mini_magick'
gem 'carrierwave', '~> 1.0'
gem 'fog-aws'

# Authentication
gem 'devise'

# Background worker
# gem 'sidekiq-cron', '~> 1.1'
# gem 'whenever', require: false
gem 'sidekiq'

# Performance
gem 'rack-mini-profiler', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'dotenv-rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', '~> 0.71.0'
  gem 'letter_opener'
  gem 'annotate'
  gem 'bullet'
end

group :test do
  gem 'simplecov', require: false
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'webmock'
  gem 'vcr'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
