Rails.application.routes.draw do

  resources :reviews
  get 'static_pages/home'
  resources :favorites

  resources :comments

  resources :internships do 
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  root to: "static_pages#home"
  devise_for :users

  # To fix the error that occured when user sign out
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show]
end
