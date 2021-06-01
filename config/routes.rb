Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :recipes, only: [ :index, :show, :new, :create ]
  resources :cookbooks, only: [ :index, :new, :create ]
  resources :ratings, only: [ :new, :create ]


end
