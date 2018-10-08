Rails.application.routes.draw do
  get 'favourites/potential_buyers/:house_id', to: 'favourites#potential_buyers'
  get 'favourites/add/:house_hunter_id/:house_id', to: 'favourites#add'
  resources :admins
  resources :names
  resources :searches
  resources :favourites
  resources :inquiries
  resources :houses
  resources :house_hunters
  resources :realtors
  resources :companies
  resources :replies
  root 'sessions#new'
  get    '/signup',  to: 'sessions#redirect'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'searches/index'
  get 'search/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
