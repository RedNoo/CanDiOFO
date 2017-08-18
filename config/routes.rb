Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'pages#index'

  resources :members, except: [:new]
  resources :users
  resources :restaurants

  get 'signup' => 'members#new'

  get 'login', to: 'sessions#new'
  post "login", to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'loginuser', to: 'user_sessions#new'
  post "loginuser", to: 'user_sessions#create'
  delete 'logoutuser', to: 'user_sessions#destroy'

  get 'restaurant_cuisines/:id', to: 'restaurants#restaurant_cuisines' , as: :restaurant_cuisines
  get 'restaurants/addcuisine/:id', to: 'restaurants#new_cuisine' , as: :new_cuisine
  get 'restaurants/addcategory/:id', to: 'restaurants#new_category' , as: :new_category
  post 'restaurants/addcuisine/:id', to: 'restaurants#add_cuisine'
  post 'restaurants/addcategory/:id', to: 'restaurants#add_category'


  get 'restaurants/product-list/:id', to: 'restaurants#get_product_by_category' , as: :category_product_list
  get 'restaurants/addproduct/:id', to: 'restaurants#new_product' , as: :new_product
  post 'restaurants/addproduct/:id', to: 'restaurants#add_product'


  get 'new-restaurants', to: 'restaurants#recently_added'

  get 'restaurants/area/:id', to: 'restaurants#area_restaurant'

  get 'restaurants/addlogo/:id', to: 'restaurants#upload_logo' , as: :upload_logo
  post 'restaurants/addlogo/:id', to: 'restaurants#add_logo' ,as: :add_logo


  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
