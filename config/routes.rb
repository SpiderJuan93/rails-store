Rails.application.routes.draw do
  resources :categories, except: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
      #get "up" => "rails/health#show", as: :rails_health_check
      #delete '/products/:id', to: 'products#destroy'
      #get '/products/new', to: 'products#new', as: :new_product
      #get '/products', to: 'products#index'
      #get '/products/:id', to: 'products#show', as: :product
      #post '/products', to: 'products#create'
      #get '/products/:id/edit', to: 'products#edit', as: :edit_product
      #patch '/products/:id', to: 'products#update'
  resources :products, path: '/' #equivale a todas las rutas relacionadas con el CRUD comenznado desde root
  # Defines the root path route ("/")
  # root "posts#index"
end
