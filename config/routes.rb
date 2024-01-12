Rails.application.routes.draw do
  resources :offers

  resources :users, only: %i[new create]

  root to: 'pages#index'
end
