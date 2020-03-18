Rails.application.routes.draw do
  namespace :admin do
      resources :searches
      resources :queries
      resources :pages
      resources :optimised_queries

      root to: "queries#index"
    end
  root to: 'application#index'
  get '/search', to: 'application#search'
  get '/articles', to: 'page#index', as: :pages
  get '/article/:id', to: 'page#show', as: :page
  get '/r', to: 'application#r'
end
