source "https://rubygems.org"
ruby "2.2.2"

gem "rails", "4.2.3"
gem "pg"
gem "puma"
gem "jsonapi-resources", github: "cerebris/jsonapi-resources", branch: "master"
gem "rspec_api_documentation"
gem "raddocs"
gem "rspec-rails", "~> 3.3.0"
gem "spring-commands-rspec"

group :development, :test do
  gem "byebug"
  gem "spring"
  gem "shoulda-matchers", "~> 3.0.0.rc1", require: false
  gem "factory_girl_rails", "~> 4.5.0"
end

group :production do
  gem "rails_12factor"
end
