Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      post '/register', to: 'registrations#create'
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
