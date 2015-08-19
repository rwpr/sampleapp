Rails.application.routes.draw do
  get 'users/new'

  get 'users/new'

  get 'users/new'

  # root 'static#home'
  # get 'static/Pages'
  # get 'static/home'
  # get 'static/help'
  # get 'static/about'
  # get 'static/contact'

  root             'static#home'
  # help_path -> '/help'
  # help_url  -> 'http://www.example.com/help'
  
  get 'help'    => 'static#help'
  get 'about'   => 'static#about'
  get 'contact' => 'static#contact'
  get 'pages'   => 'static#pages'
  get 'signup'   => 'users#new'
  # 'signup' -- signup_path
  # users#new -- /users/new

  # routes a GET request for the URL /help to the help action in the Static Pages controller, 
  # so that we can use the URL /help in place of the more verbose /static_pages/help. As with
  # the rule for the root route, this creates two named routes, help_path and help_url:
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

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
