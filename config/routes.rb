Rails.application.routes.draw do
  root "home#index"
  resources :drafts
  resources :news
  resources :commissioners
  resources :drafts
  resources :headlines
  resources :leagues do
    resources :dues
    resources :managers
  end

  get '/leagues/:id/finances' => 'leagues#get_finances', as: 'league_finances'
  get '/leagues/:id/manage_finances' => 'leagues#manage_finances', as: "manage_finances"
  get '/leagues/:id/back' => 'leagues#back', as: 'league_back'
  get '/managers/text/:id' => 'managers#write_text', as: 'write_text'
  post '/managers/text/:id' => 'managers#send_text', as: 'send_text'
  post 'twilio/text/:id' => 'twilio#send_text_message', as: 'twilio_text'
  get 'managers/email/:id' => 'managers#write_email', as: 'email'
  post 'managers/email/:id' => 'managers#send_email', as: 'send_email'
  get 'leagues/email/:id' => 'leagues#write_email', as: 'league_email'
  post 'leages/email/:id' => 'leagues#send_email', as: 'league_send_email'
  get 'managers/prompt/:id' => 'managers#prompt', as: 'prompt'
  get 'homescreen' => 'home#back'
  get '/signup' => 'commissioners#new'
  post '/signup' => 'commissioners#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/dues/pay/:id' => 'dues#pay', as: 'pay'
  get '/leagues/:id/dues_text' => 'dues#write_text', as: 'dues_text'
  post '/leagues/:id/dues_text' => 'dues#text_non_payers', as: 'send_dues_text'



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
