REAgency::Application.routes.draw do
  resources :saved_real_estates
  resources :roles
  resources :real_estate_types
  resources :real_estate_details
  resources :tasks
  resources :reports
  resources :contracts
  resources :offices
  resources :cities
  resources :real_estates
  resources :items
  resources :user_roles
  resources :activities
  resources :users
  resources :countries
  resources :sessions, only: [:new, :create, :destroy]

  match '/',        to: 'static_pages#home'
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/save_real_estate', to: 'saved_real_estates#create'
  match '/apartments', to: 'real_estates#apartments'
  match '/houses', to: 'real_estates#houses'
  match '/garages', to: 'real_estates#garages'
  match '/rooms', to: 'real_estates#rooms'
  match '/others', to: 'real_estates#others'
  match '/mark_as_finished', to: 'real_estates#mark_as_finished'

  match '/monthly_articles', to: 'reports#monthly_articles'
  match '/contract_real_estates', to: 'real_estates#contract_real_estates'
  match '/real_estates_by_city', to: 'reports#real_estates_by_city'
  match '/number_of_real_estates_per_user', to: 'reports#number_of_real_estates_per_user'
  match '/total_number_of_users', to: 'reports#total_number_of_users'
  match '/total_number_of_real_estates', to: 'reports#total_number_of_real_estates'
  match '/number_of_rented_real_estates', to: 'reports#number_of_rented_real_estates'
  match '/number_of_rented_by_city', to: 'reports#number_of_rented_by_city'
  match '/number_of_rented_real_estates_per_month', to: 'reports#number_of_rented_real_estates_per_month'
  match '/number_of_rented_real_estates_per_user', to: 'reports#number_of_rented_real_estates_per_user'


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
  root :to => 'static_pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
