# config/routes.rb
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'customers', to: 'api_requests#customers'
      get 'categories', to: 'api_requests#categories'
      get '/weather/:city', to: 'weather#show'
    end
  end
end
