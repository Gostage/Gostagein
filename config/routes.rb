Rails.application.routes.draw do

  root "static_pages#home"
  resources :reviews
  resources :favorites
  resources :internships do 
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :comments, except: [:index, :show] do
      resources :comments, except: [:index, :show]
    end
    resources :favorites, only: [:new, :create, :destroy]
  end
  devise_for :users

  # To fix the error that occured when user sign out
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show]
end
