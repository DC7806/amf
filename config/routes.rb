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
    resources :clients, :contents, :portfolios, :teams, except: :show  
    match 'about-us', to: 'static_contents#about', via: [:get, :patch]
  end

end
