Rails.application.routes.draw do
  namespace :users, path: 'app' do
    resources :projects do
      resources :tasks, except: [:index]
    end
  end

  devise_for :users
  root 'pages#home'
end
