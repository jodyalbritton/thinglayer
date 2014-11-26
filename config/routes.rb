require 'api_contraints'
Rails.application.routes.draw do
 


  resque_constraint = lambda do |request|
    request.env['warden'].authenticate? && (request.env['warden'].user.has_role? :admin)
  end
  
  get 'dashboard/index'

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  resources :omniauth_callbacks
  resources :services
  resources :things
  resources :dashboard
  resources :messages, only: [:new, :create]

  match '/dashboard/search/:query' => 'dashboard#search', :as => 'search', via: [:get, :post]
  match "/auth/:provider/callback" => "omniauth_callbacks#create", via: [:get, :post]


  resources :locations do 
    resources :zones do 
      post 'sort', on: :collection
    end
  end
  constraints resque_constraint do
   mount Resque::Server, :at => "/resque"
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
# Api definition
  resources :admin, only: [:index]

  namespace :admin do
        resources :faqs
        resources :messages
        resources :users
  end 
  
  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
     resources :users, :only => [:show]
    end
  end
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable
  root :to => "dashboard#index"
  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
