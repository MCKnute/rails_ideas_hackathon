Rails.application.routes.draw do
  resources :bright_ideas
  root 'main#index'

  get 'sessions/new'

  post 'sessions' => 'sessions#create'

  delete 'sessions' => 'sessions#destroy'

  post 'users' => 'users#create'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  delete 'users/:id' => 'users#destroy'
  get 'users/:id' => 'users#show', as: :user

  get 'bright_ideas' => 'bright_ideas#index', as: :ideas
  post 'bright_ideas' => 'bright_ideas#create'
  get 'bright_ideas/:id/edit' => 'bright_ideas#edit', as: :edit_idea
  patch 'bright_ideas/:id' => 'bright_ideas#update'
  delete 'bright_ideas/:id' => 'bright_ideas#destroy'
  get 'bright_ideas/:id' => 'bright_ideas#show', as: :idea

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
