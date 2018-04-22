Rails.application.routes.draw do
  
  devise_for :admin_users, controllers: {sessions: "sessions", registrations: "registrations"}

  scope '(:locale)', locale: /en|zh-TW|zh-CN/ do
    root 'pages#homepage'
    get 'about-us', to: 'pages#about'
    resources :portfolios, only: :index
    resources :inquiries, only: [:new, :create]
    get '/inquiries', to: redirect('/about-us')
  end

  namespace :admin, path: Figaro.env.admin_path do
    root 'portfolios#index'
    resources :clients, :contents, :portfolios, :teams, except: :show  
    resources :images, only: :update
    resources :inquiries, only: [:index, :show, :destroy]
    match 'about-us', to: 'static_contents#about', via: [:get, :patch]
    match 'system', to: 'static_contents#system', via: [:get, :patch]
    resources :translations, only: [:index, :new, :create] do
      collection do
        patch 'update_all'
      end
    end
    resources :meta, only: [:index, :edit, :update]
  end

end
