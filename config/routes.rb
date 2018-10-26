Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :links
    resources :reviews
    resources :points
    root to: 'products#index'
  end
  root to: 'application#index'
  get 'about', to: 'application#about'
  get 'product/:product', to: 'products#show', as: :product
  get 'contact-me', to: 'messages#new', as: 'new_message'
  post 'contact-me', to: 'messages#create', as: 'create_message'
end
