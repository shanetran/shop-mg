Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        :registrations => "users/registrations"
      }

  devise_scope :user do
    get '/information', to: 'users/registrations#information', as: 'information'
    post '/informations', to: 'users/registrations#informations', as: 'informations'
  end
  
  resources :products
  
end
