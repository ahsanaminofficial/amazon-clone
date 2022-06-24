Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: "home#index"
  get '/product/own' => "product#ownproducts"
  # resources :product, :comment
  resources :product do
    resources :comment
  end


  
  get '/cart/' => "cart#index"
  post '/cart/:product_id/add' => "cart#add", as: :cart_add
  post '/cart/:id/del' => "cart#delete", as: :cart_delete

  # resources :cart

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
