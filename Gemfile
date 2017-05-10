source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'elasticsearch-model',
    git: 'https://github.com/elastic/elasticsearch-rails.git',
    branch: 'v5.0.1'
gem 'elasticsearch-persistence',
    git: 'https://github.com/elastic/elasticsearch-rails.git',
    branch: 'v5.0.1'
gem 'elasticsearch-rails',
    git: 'https://github.com/elastic/elasticsearch-rails.git',
    branch: 'v5.0.1'
gem 'pg', '~> 0.20.0'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'timecop', '~> 0.8.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
