Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # root to: "users#sign_in"
  root to: "home#index"
  resources :product
  get '/product/own',  to: "product#show_own_products"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
