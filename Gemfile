# frozen_string_literal: true
source 'https://gems.ruby-china.org/'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'pg'
gem 'ipaddress'
gem 'bootstrap-sass', '3.3.7'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'will_paginate', '3.1.0'
gem 'autoprefixer-rails'
gem 'devise'
gem 'devise_token_auth'
gem 'httparty'
gem 'omniauth-github', github: 'intridea/omniauth-github'
gem 'cocoon'
gem 'haml'
gem 'jquery-ui-rails'
gem 'simple_form'
gem 'acts_as_list'
gem 'amoeba'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'kaminari'
gem 'rails_admin', '~> 1.1.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'faker',  '1.6.6'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
  gem 'erb2haml'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
