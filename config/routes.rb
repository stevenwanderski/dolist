Rails.application.routes.draw do
  namespace :users do
    resources :dashboard, only: [:index]
  end

  devise_for :users
  root 'pages#home'
end
