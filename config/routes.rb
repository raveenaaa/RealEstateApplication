Rails.application.routes.draw do
  get 'favourites/potential_buyers/:house_id', to: 'favourites#potential_buyers'
  get 'favourites/add/:house_hunter_id/:house_id', to: 'favourites#add'
  get '/realtors/update_profile/:company_id', to: 'realtors#update_profile'
  get '/home', to: 'static_pages#home'
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
  root 'static_pages#home'
  get    '/signup',  to: 'sessions#redirect'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get 'searches/index'
  get 'search/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
