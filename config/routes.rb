Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  root 'site#index'
#vendor
    get '/vendor' => 'vendors#index'
        get '/vendors' => 'vendors#show'
        get '/vendors/examineevent/:id' => 'vendors#examine_event'
        get '/vendors/examineorganizer/:id' => 'vendors#examine_organizer'
        
        

#organizers
    get '/organizer' => 'organizers#index'
      
      get '/organizers/addevent' => 'organizers#new'
      post '/organizers/addevent' => 'organizers#create'
      get '/organizers/showevent/:id' => 'organizers#event_show'
      delete 'organizer/deleteevent/:id' => 'organizers#event_delete'
      get '/organizers/examinevendor/:id' => 'organizers#examine_vendor'
      get '/organizers/:id' => 'organizers#show'
#staf
    get '/staff' => 'staff#index'
#api
  get '/api/events/:id/comments' => 'api#get_comments'
  post '/api/events/:id/comments' => 'api#add_comments'
  get '/api/vendors/vendorinfo/:id' => 'api#vendor_info'
  delete '/api/event/:id/deleteconfirmedservice/:service_id' => 'api#delete_confirmed_service'

  post '/api/events/addservice' => 'api#add_service'
#profiles
  get '/profiles/:id' => 'profiles#show', as: :profile
  put '/profiles/:id' => 'profiles#update'

#messages
  post '/api/message/send_confirmation' => 'api#send_confirmation'
  get '/api/message/:id/messages' => 'api#serve_messages'
  get '/api/messages/confirm_read' => 'api#confirm_messages'

  
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
