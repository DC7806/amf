source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'simple_form'
gem 'kaminari'
gem 'ckeditor', git: 'https://github.com/galetahub/ckeditor.git', branch: 'master'#, github: 'galetahub/ckeditor'
gem 'delayed_job_active_record'
gem "figaro"
# gem 'settingslogic'
gem "breadcrumbs_on_rails"
# translation
gem 'i18n-active_record', require: 'i18n/active_record'
gem 'mobility', '~> 0.3.6'
# file upload
gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
# contact form validation
gem "recaptcha", require: "recaptcha/rails"
# devise
gem 'devise'
gem 'devise-async'
# assets
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'rails_sortable'
gem 'jquery-fileupload-rails'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'font-awesome-rails'
gem 'font-ionicons-rails'
# deploy
gem 'whenever', require: false
gem 'capistrano3-delayed-job', '~> 1.0'

group :production do
  # sitemap
  gem 'sitemap_generator', require: true 
end

group :development, :test do
  gem 'capistrano', '~> 3.10', '>= 3.10.1'
  gem 'capistrano-rails', '~> 1.3', '>= 1.3.1'
  gem 'capistrano-rbenv', git: 'https://github.com/capistrano/rbenv.git', branch: 'master'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print', git: 'https://github.com/awesome-print/awesome_print.git', branch: 'master'
end