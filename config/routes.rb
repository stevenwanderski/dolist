Rails.application.routes.draw do
  namespace :users, path: 'app' do
    resources :projects
  end

  devise_for :users
  root 'pages#home'
end
