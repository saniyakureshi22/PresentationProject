Rails.application.routes.draw do
  # get 'employees/index'
  # get 'employees/create'
  # get 'employees/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :employees do
    collection do
      get 'filter'
    end
  end
end
