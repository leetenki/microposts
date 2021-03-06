Rails.application.routes.draw do
  root :to => 'static_pages#home'

  get 'users/subregion_options' => 'users#subregion_options'
  get 'signup', :to => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'users/followings/:id' => 'users#followings', :as => :followings_user
  get 'users/followers/:id' => 'users#followers', :as => :followers_user
  get 'users/tweets/:id' => 'users#tweets', :as => :tweets
  post 'users/search' => 'users#search'
  get  'users/search' => 'users#search'
  get 'users/microposts/:id' => 'users#favorites', :as => :favorites

  post 'microposts/retweet' => 'microposts#retweet', :as => :retweet
  post 'microposts/reply' => 'microposts#reply', :as => :reply
  post 'microposts/favorite' => 'microposts#favorite', :as => :favorite

  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts
  resources :relationships, :only => [:create, :destroy]

  # post 'tweet' => 'microposts#create'
  # get 'tweet' => 'micropost#edit'

  # get 'sessions/new'
  # get 'users/new'
  # get 'static_pages/home'

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
