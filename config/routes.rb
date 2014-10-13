Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :comments
  resources :entries
  resources :votes

  root 'entries#index'
end
