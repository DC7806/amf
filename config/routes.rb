Rails.application.routes.draw do
  
  scope '(:locale)', locale: /en|zh-TW|zh-CN/ do
    resources :portfolios, only: :index
  end

  namespace :admin do
    resources :portfolios, except: :show  
  end

end
