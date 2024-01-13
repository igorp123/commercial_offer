Rails.application.routes.draw do
  resources :offers

  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]

  root to: 'pages#index'
end
