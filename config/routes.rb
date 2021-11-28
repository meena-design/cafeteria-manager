Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :menus
  resources :orders
  resources :menu_item
  resources :users
  resources :order_items
  resources :active_menus

  get "/" => "home#index"
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
  get "/user/orders/", to: "orders_user#index", as: "orders_user"
  get "/active/orders/", to: "orders_active#index", as: "orders_active"
  get "/user/completed/", to: "orders_user_completed#index", as: "orders_user_completed"
  get "/mypanel/", to: "mypanel#index", as: "mypanel"

  #post "/" => "menus#create"

end
