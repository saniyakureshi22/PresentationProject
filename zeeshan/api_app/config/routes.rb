Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/translate', to: 'languages#translate'
      get '/fetch_languages', to: 'languages#fetch_languages'
    end
  end
end
