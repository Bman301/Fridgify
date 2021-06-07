Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :recipes, only: [ :index, :show, :new, :create ] do
    resources :ratings, only: [:create ]
    resources :cookbooks, only: [ :create ]
  end

  post "/recipes/api_call", to: "recipes#api_call"
  resources :cookbooks, only: [:index, :destroy]

end
