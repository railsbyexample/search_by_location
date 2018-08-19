source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Use posgresql full_text_search
gem 'pg_search'
# Use GeoCoder for distance queries
gem 'geocoder'

# Use haml for html templates
gem 'haml-rails'

# Use Faker for  values
gem 'faker', '~> 1.7'

group :development, :test do
  # Use rubocop for linting and static analysis
  gem 'rubocop', '~> 0.49.1', require: false
  # Use rspec for testing
  gem 'rspec-rails', '~> 3.5'
  # Use controller testing helpers
  gem 'rails-controller-testing'
  # Use FactoryGirl to replace fixtures with factories
  gem 'factory_girl_rails', '~> 4.0'
  # Use Faker for factory values
  gem 'faker', '~> 1.7'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
