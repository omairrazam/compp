Rails.application.routes.draw do
  match 'orders/thank_you', to: 'orders#thank_you', via: [:get]
  
  namespace :admin do
    resources  :orders
    resources  :dashboards
  end

  match 'admin', to: 'admin/dashboards#index', via: [:get]
  
  resources  :orders do
    resources :addresses
  end
  resources  :photos
  resources  :carts

  devise_for :users

  
  match 'carts/add', to: 'carts#add', via: [:post]
  match 'carts/remove', to: 'carts#remove', via: [:post]
  match 'orders/place_order', to: 'orders#place_order', via: [:post]
  
  root 'photos#index'
  
  #get 'orders/thank_you'
  #get 'carts/show'
  # The priority is based upon orders of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  
  

  # Example of regular route:
  #  get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
