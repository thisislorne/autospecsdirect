Rails.application.routes.draw do
  namespace :admin do
      resources :searches
      resources :queries
      resources :optimised_queries

      root to: "queries#index"
    end
  root to: 'application#index'
  get '/search', to: 'application#search'
  get '/r', to: 'application#r'
end
