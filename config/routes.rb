Rails.application.routes.draw do
  namespace :users, path: 'app' do
    resources :projects, except: [:destroy] do
      member do
        get '/delete', action: :destroy
      end
    end
  end

  devise_for :users
  root 'pages#home'
end
