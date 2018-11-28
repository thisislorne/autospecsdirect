Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :features
    root to: 'products#index'
  end
  root to: 'application#index'
  get 'about', to: 'application#about'
  get 'downloads', to: 'application#downloads_list'
  get 'download/:os/:product', to: 'application#download_software', as: :download
  get ':os/:product', to: 'application#product', as: :product
end
