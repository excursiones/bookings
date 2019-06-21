Rails.application.routes.draw do
  root 'users#new'

  get '/home', to: 'home#view'
  post '/login', to: 'sessions#create', as: :login

  patch '/reservations/cancel/:id', to: 'reservations#cancel'
  get '/reservations/cancelled', to: 'reservations#cancelled'
  get '/reservations/pending/:user', to: 'reservations#pending'
  get '/reservations/cancelled/:user', to: 'reservations#cancelled'
  get '/reservations/cancelled/excursion-package/:id', to: 'reservations#cancelled_target'
  get '/reservations/excursion-package', to: 'reservations#target'
  get '/reservations/filter-by-date', to: 'reservations#filter_by_date'

  resources :reservations
end
