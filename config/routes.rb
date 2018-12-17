Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :features
    root to: 'products#index'
  end
  root to: 'application#index'
  get 'gs_event', to: 'application#gs'
  get 'about', to: 'application#about'
  get 'downloads', to: 'application#downloads'
  get 'lp/:product', to: 'application#lp', as: :lp
  get ':product', to: 'application#product', as: :product

end
