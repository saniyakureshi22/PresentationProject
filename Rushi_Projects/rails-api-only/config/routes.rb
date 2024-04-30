Rails.application.routes.draw do
  resources :hospitals
  post '/login', to: 'auth#login'

end
