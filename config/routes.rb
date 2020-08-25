Rails.application.routes.draw do

  get 'moods/checkin'
  get 'moods/checkin2'
  get 'lessons/show'

  get 'journeys/show'

  get 'users/home'
  get 'users/show'
  get 'users/social'
  get 'users/tools'
  get 'users/support'
  root to: 'pages#home'
  get 'checkin', to: 'pages#checkin'
  get 'checkin2', to: 'pages#checkin2'

  devise_for :users
  get 'users', to: "users#home"
  get 'users/social', to: 'users#social'
  get 'users/tools', to: 'users#tools'
  get 'users/support', to: 'users#support'

  resources :journeys, only: [:show]
  resources :lessons, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
