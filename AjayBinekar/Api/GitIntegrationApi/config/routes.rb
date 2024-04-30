Rails.application.routes.draw do
 namespace :api do
    namespace :v1 do
      get 'repositories', to: 'github_api#repositories'
      get 'commits', to: 'github_api#commits'
    end
  end
end
