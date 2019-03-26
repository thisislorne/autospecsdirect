Rails.application.routes.draw do
  namespace :admin do
      resources :searches
      resources :queries

      root to: "queries#index"
    end
  root to: 'application#index'
  get '/search', to: 'application#search'
end
