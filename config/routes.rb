Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :properties do
        collection do
          get 'search'
        end
      end
      
      resources :users do
        post 'login', on: :collection
      end
      
      resources :listings, only: [:index, :create, :destroy]
    end
  end
end
