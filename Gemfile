source 'https://rubygems.org'


gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0'
gem 'responders', '~> 2.0' #for respond_to and respond_with
gem 'active_model_serializers', '~> 0.8.0' #to format json response
gem 'rails_param' #to validate/coerce request parameters
gem 'rack-cors', :require => 'rack/cors' #to set up cors
gem 'pubnub' #pubnub ruby library
gem 'wit'  #wit ruby sdk


group :development, :test do
  gem 'spring'
  gem 'sqlite3'
end


group :production do
  # production gems for heroku deployment
  gem 'rails_12factor'
  gem 'pg'
end