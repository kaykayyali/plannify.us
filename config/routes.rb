Rails.application.routes.draw do
  devise_for :users
  

  root 'site#index'
#vendor
    get '/vendor/:date' => 'vendors#index'
        get '/vendors' => 'vendors#show'
        get '/vendors/examineevent/:id' => 'vendors#examine_event'
        get '/vendor/events/servicing' => 'vendors#servicing'
        

#organizers
    get '/organizer/:date' => 'organizers#index'
      
      get '/organizers/addevent' => 'organizers#new' 
      post '/organizers/addevent' => 'organizers#create'
      get '/organizers/showevent/:id' => 'organizers#event_show', as: :organizers_event
      delete 'organizer/deleteevent/:id' => 'organizers#event_delete'
      get '/organizers/examinevendor/:id' => 'organizers#examine_vendor'
      get '/organizers/:id' => 'organizers#show'
#staf
    get '/staff' => 'staff#index'
#api
  get '/api/events/:id/comments' => 'api#get_comments'
  post '/api/events/:id/comments' => 'api#add_comments', as: :add_comment
  post '/api/events/:id/comments/redact' => 'api#redact'
  get '/api/vendors/vendorinfo/:id' => 'api#vendor_info'
  delete '/api/event/:id/deleteconfirmedservice/:service_id' => 'api#delete_confirmed_service'
  post '/api/event/confirm/:id' => 'api#confirm_event'
  post '/api/events/addservice' => 'api#add_service'
  get '/api/messages/unread_count/:id' => 'api#unread_get'
  get '/api/messages/confirm_all/:id' => "api#confirm_all"
  get '/api/events/:id/check_confirmed' => 'api#check_confirmed'

#profiles
  get '/profiles/:id' => 'profiles#show', as: :profile
  put '/profiles/:id' => 'profiles#update'

#messages
  post '/api/message/send_confirmation' => 'api#send_confirmation'
  get '/api/message/:id/messages' => 'api#serve_messages'
  get '/api/messages/confirm_read' => 'api#confirm_messages'
  get '/calendar' => 'api#calendar', as: :calendar
  get '/api/events/calendar_get' => 'api#send_events'

  
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
