Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Define routes here
      get 'raw_sql/select_all', to: 'raw_sql#select_all'
      # get 'raw_sql/select_by_id/:id', to: 'raw_sql#select_by_id'
      get 'raw_sql/select_where/:id', to: 'raw_sql#select_where'
      post 'raw_sql/insert', to: 'raw_sql#insert'
      put 'raw_sql/update/:id', to: 'raw_sql#update'
      delete 'raw_sql/delete/:id', to: 'raw_sql#delete'
    end
  end
end
