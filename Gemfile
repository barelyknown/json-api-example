source "https://rubygems.org"

gem "rails", "4.2.3"
gem "pg"
gem "puma"
gem "jsonapi-resources", git: "https://github.com/cerebris/jsonapi-resources", branch: "master"
gem "rspec_api_documentation"
gem "apitome"
gem "rspec-rails", "~> 3.3.0"
gem "spring-commands-rspec", platform: :ruby

group :development, :test do
  gem "byebug"
  gem "spring", platform: :ruby
  gem "shoulda-matchers", "~> 3.0.0.rc1", require: false
  gem "factory_girl_rails", "~> 4.5.0"
end

group :production do
  gem "rails_12factor"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
