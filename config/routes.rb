Rails.application.routes.draw do
  
  scope '(:locale)', locale: /en|zh-TW|zh-CN/ do
    resources :portfolios, only: :index
  end

  namespace :admin do
    resources :clients, :portfolios, :teams, except: :show  
  end

end
