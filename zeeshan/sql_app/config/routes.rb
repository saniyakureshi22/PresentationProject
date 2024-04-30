Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'users/like_query', to: 'users#like_query', as: 'user_like_query'
      get 'users/count_query', to: 'users#count_query', as: 'user_count_query'
      get 'users/inner_join_query', to: 'users#inner_join_query', as: 'user_inner_join_query'

      resources :users do
        resources :articles
      end
      
    end
  end
end