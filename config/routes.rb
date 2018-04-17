Rails.application.routes.draw do
  
  devise_for :admin_users, controllers: {sessions: "sessions", registrations: "registrations"}

  scope '(:locale)', locale: /en|zh-TW|zh-CN/ do
    root 'pages#homepage'
    get 'about-us', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    resources :portfolios, only: :index
  end

  namespace :admin, path: Figaro.env.admin_path do
    root 'portfolios#index'
    resources :clients, :contents, :portfolios, :teams, except: :show  
    resources :images, only: :update
    match 'about-us', to: 'static_contents#about', via: [:get, :patch]
    match 'system', to: 'static_contents#system', via: [:get, :patch]
  end

end
