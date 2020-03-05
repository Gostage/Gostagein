Rails.application.routes.draw do

  resources :favorites

  resources :comments

  resources :internships
  root to: "users#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
