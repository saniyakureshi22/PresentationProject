Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do
     resources :users do
       collection do
         get 'inner_join', to: 'users#inner_join'
         get 'left_join', to: 'users#left_join'
         get 'right_join', to: 'users#right_join'
         get 'full_join', to: 'users#full_join'
       end
     end
   end
  end
end