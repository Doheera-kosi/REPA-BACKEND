# Rails.application.routes.draw do
#   namespace :api do
#     namespace :v1 do
#       get 'listings/index'
#       get 'listings/create'
#       get 'listings/destroy'
#       get 'users/index'
#       get 'users/show'
#       get 'users/create'
#       get 'users/update'
#       get 'users/destroy'
#       get 'properties/index'
#       get 'properties/show'
#       get 'properties/create'
#       get 'properties/update'
#       get 'properties/destroy'
#     end
#   end
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   # Defines the root path route ("/")
#   # root "articles#index"
# end

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :properties
      resources :users
      resources :listings, only: [:index, :create, :destroy]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
