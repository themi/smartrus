source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
# gem "sidekiq"
# gem 'whenever', require: false

gem "pg", ">= 0.18", "< 2.0"
# gem "redis", "~> 4.0"

gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "momentjs-rails"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

gem "bcrypt", "~> 3.1.7"
gem "cancancan", "~> 2.0"
gem "devise"

gem "acts_as_list"
gem "bootstrap", "~> 4.1.1"
gem "bootstrap4-kaminari-views"
gem "country_select"
gem "font-awesome-rails"
gem "kaminari"
gem "simple_form"
# gem "devise-bootstrap-views"
# gem "cocoon"

# gem "lazy_high_charts"
# gem "prawn"
# gem "prawn-table"

gem "image_processing", "~> 1.2"
gem "mini_magick", "~> 4.8"

gem "bootsnap", ">= 1.1.0", require: false

# gem "recaptcha", require: "recaptcha/rails"
# gem "stripe"

# gem "ops_care",
#   :git => "git@github.com:reinteractive/OpsCare.git",
#   :branch => "master"
# gem "asset_sync"
# gem "fog-aws"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "ffaker"
  gem "reinteractive-style"
  gem "rspec-rails"
  gem "rubocop", "~> 0.56.0", require: false
end

group :development do
  gem "annotate"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara"
  gem "database_cleaner"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  gem "simplecov", require: false
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
