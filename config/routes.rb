Rails.application.routes.draw do
  resources :o_orders
  post 'o_orders/CreateOutOrder' => 'o_orders#CreateOutOrder'
  get 'o_orders/split/:id' => 'o_orders#split'
  get 'go_down_items/search' => 'go_down_items#search'
  resources :go_down_items
  get 'in_orders' => 'in_orders#index'
  get 'in_orders/:id' => 'in_orders#index'
  post 'in_orders/ingodown' => 'in_orders#ingodown'
  get 'in_orders/exec/:id' => 'in_orders#exec'
  get 'in_orders/show/:id' => 'in_orders#show'

  get 'out_orders/' => 'out_orders#index'
  post 'out_orders/outgodown' => 'out_orders#outgodown'
  get 'out_orders/exec/:id' => 'out_orders#exec'
  get 'out_orders/show/:id' => 'out_orders#show'

  #---------------------------------------LEE ADD START
  namespace :origin do
    resources :sidebar_items
  end

  namespace :origin do
    resources :sites
  end

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

  resources :users
  #---------------------------------------LEE ADD END

  get 'orders/split/:id' => 'orders#split'

  resources :sub_orders

  resources :orders

  get 'static_pages/home'

  get 'static_pages/help'

  resources :batches

  resources :go_downs

  resources :items

  #post '/sub_categories' => 'categories#create_sub'
  resources :sub_categories

  resources :categories
  post 'Category/create_sub' => 'categories#create_sub'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => 'static_pages#home', :as => 'home'

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
