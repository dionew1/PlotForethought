source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jbuilder'
gem 'figaro'
gem 'cloudinary'
gem 'omniauth-google-oauth2'
gem 'bootstrap-sass'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
  gem 'capybara'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'faker'
  gem 'database_cleaner'
  gem 'newrelic_rpm'
  gem "factory_bot_rails"
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'bullet'
end

group :test do
  gem 'webmock'
  gem 'vcr'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
