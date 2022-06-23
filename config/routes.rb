Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # root to: "users#sign_in"
  root to: "home#index"
  get '/product/own' => "product#ownproducts"
  resources :product
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
