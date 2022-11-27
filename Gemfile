source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.5"

gem "rails", "~> 7.0.4" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'graphql'
gem "pg", "~> 1.1" # Use postgresql as the database for Active Record
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'sorbet-runtime'
gem 'erubi', '~> 1.11.0'

# gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
# gem "kredis" # Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "bcrypt", "~> 3.1.7" # Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "rack-cors" # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'graphiql-rails'
  gem 'faker'
  gem 'sorbet'
  gem 'tapioca', require: false
end


