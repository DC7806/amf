Rails.application.routes.draw do
  
  devise_for :admin_users, controllers: {sessions: "sessions", registrations: "registrations"}

  scope '(:locale)', locale: /en|zh-TW|zh-CN/ do
    root 'pages#homepage'
    get 'about-us', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    resources :portfolios, only: :index
  end

  namespace :admin do
    root 'portfolios#index'
    resources :clients, :portfolios, :teams, except: :show  
  end

end
