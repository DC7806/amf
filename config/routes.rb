Rails.application.routes.draw do
  
  namespace :admin do
    resources :portfolios, except: :show  
  end

end
