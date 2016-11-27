Rails.application.routes.draw do

  root 'pages#home'
  get '/home' => 'pages#home'
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'

  get '/login' => 'session#new', as: 'login'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users

  get 'org_cal/:id' => 'organisations#calendar', as: 'org_cal'
  get '/org_join/:id' => 'organisations#join', as: 'org_join'
  get '/organisation/:id' => 'organisations#user', as: 'org_user'
  resources :organisations

  get '/organisation_posts/:id' => 'organisation_posts#show', as: 'organisation_posts'
  post '/organisation_posts/:id' => 'organisation_posts#create'
  delete '/organisation_posts/:id' => 'organisation_posts#destroy'

  get '/group_join/:id' => 'groups#join', as: 'group_join'


  resources :groups
  get '/group/:id' => 'groups#user', as: 'group_user'
  post '/groups' => 'groups#create'

  resources :group_posts

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
