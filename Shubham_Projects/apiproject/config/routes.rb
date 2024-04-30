Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'postal_pincode/get_post_office_by_pincode/:pincode', to: 'postal_pincode#get_post_office_by_pincode'
      get 'postal_pincode/get_post_office_by_branch_name/:branch_name', to: 'postal_pincode#get_post_office_by_branch_name'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :weather_forecasts, only: [:index]
    end
  end
  
end
