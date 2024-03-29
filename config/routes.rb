Bestbay::Application.routes.draw do

  resources :reports do
     collection do
       get 'auctionreport'
       get 'usereport'
       get 'biddingreport'
     end
   end

   devise_for :admins do
      get 'admins', :to => 'welcome#adminhomepage', :as => :admin_root
   end

  resources :line_bids

  resources :bidcarts

  resources :payment_notifications

  resources :line_items

  resources :carts

  resources :videos


  resources :categories

  #ActiveAdmin.routes(self)

  #devise_for :admin_users, ActiveAdmin::Devise.config

  resources :notifications

  resources :biddings do
    collection do
      get 'notifications'
    end
  end

  resources :searches do
    collection do
      get 'auctionreport'
    end
  end


  resources :items  do
    collection do
      get 'electronics'
      get 'laptop'
      get 'cellphone'
      get 'television'
    end

  end

  devise_for :users do

   get 'users', :to => 'welcome#homepage', :as => :user_root
     end

  root :to => 'welcome#homepage'

  get "welcome/homepage"
  get "items/new"
  post "biddings/new"
  post "biddings/buynew"
  post "biddings/success"


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
