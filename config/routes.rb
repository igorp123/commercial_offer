Rails.application.routes.draw do
  resources :offers

  root to: 'pages#index'
end
