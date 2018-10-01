Rails.application.routes.draw do
  resources :searches
  root 'sessions#new'
  get    '/signup',  to: 'sessions#redirect'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :favourites
  resources :inquiries
  resources :houses
  resources :house_hunters
  resources :realtors
  resources :companies
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
