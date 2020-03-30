Rails.application.routes.draw do

  resources :reviews
  get 'static_pages/home'
  resources :favorites

  resources :comments

  resources :internships
  root to: "static_pages#home"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
end
