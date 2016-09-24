Rails.application.routes.draw do
  post '/start', to: 'chat#start'
  post '/message', to: 'chat#message'
end
