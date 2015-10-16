Rails.application.routes.draw do

  get 'checkout/index'

  root to: 'home#index'
  get "/search", to: "home#search"
  resources :categories
  resources :brands
  resources :orders
  resources :checkouts
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        :registrations => "users/registrations"
      }

  devise_scope :user do
    get '/information', to: 'users/registrations#information', as: 'information'
    post '/informations', to: 'users/registrations#informations', as: 'informations'
  end
  
  resources :products do
    collection do
      get "top_sell"
      get "top_new"
    end
    member do
      get "related"
    end
  end
  
  resources :carts do
    member do
      post "add"
      delete "remove"
    end
    collection do
      post "updated"
    end
  end
  
end
