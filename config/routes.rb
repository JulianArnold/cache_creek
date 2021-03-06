# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search/index'
  post 'search/index', as: :search_request

  namespace :admin do
    resources :subscription_products
    resources :subscription_plans
  end
  resources :curriculum_vitaes do
    member do
      get :upload
    end
  end
  resources :opportunities
  resources :organisations
  resources :password_changes, only: %i[new create]
  resources :people
  resources :users, except: %i[new create]
  resources :user_sessions, only: %i[new create destroy]
  resources :user_sign_ups, only: %i[new create] do
    collection do
      get 'confirm/:code', action: :confirm, as: :confirm
    end
  end
  get '/my_profile', to: 'users#show', as: :my_profile

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'opportunities#index'

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
