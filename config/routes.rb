Rails.application.routes.draw do
  devise_for :users
  root 'site#index'
    get '/vendor' => 'vendors#index'
        get '/vendors' => 'vendors#show'
        get '/vendors/examineevent/:id' => 'vendors#examine_event'
        get '/vendors/examineorganizer/:id' => 'vendors#examine_organizer'
        
        


    get '/organizer' => 'organizers#index'
      
      get '/organizers/addevent' => 'organizers#new'
      post '/organizers/addevent' => 'organizers#create'
      get '/organizers/showevent/:id' => 'organizers#event_show'
      delete 'organizer/deleteevent/:id' => 'organizers#event_delete'
      get '/organizers/examinevendor/:id' => 'organizers#examine_vendor'
      get '/organizers/:id' => 'organizers#show'

    get '/staff' => 'staff#index'
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
