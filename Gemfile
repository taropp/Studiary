source 'https://rubygems.org'

gem 'rails', '~> 5.1.6'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0' #js圧縮機
gem 'faker'
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

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rubocop-airbnb' #Ruby警察
  gem 'sqlite3'
  gem "rspec-rails" #test
  gem "factory_bot_rails" #DB登録modelビルド簡略化
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'pg', '0.20.0'
  gem 'fog'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'#全ての元凶：user周り(詳しくわからない闇)
gem 'omniauth'#sns認証
gem 'omniauth-facebook'
gem 'dotenv-rails' #環境変数を管理
# gem 'bootstrap', '~> 4.1.1' => 競合していたためコメントアウト。今後間違えないよう放置。
gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'
gem 'kaminari-bootstrap'
# gem 'therubyracer' # lessを翻訳するために必要 => mini_racerに座を奪われた
gem 'mini_racer'
gem 'twitter-bootstrap-rails', '~> 4.0'
gem 'jquery-rails'
gem 'kaminari' #ページネーション
gem 'carrierwave'
gem 'mini_magick'