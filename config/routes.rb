Rails.application.routes.draw do
  
  unauthenticated do
    root :to => 'welcome#index'
  end
 
  authenticated do
    root :to => 'plants#index'
  end

  resources :actions
  resources :plants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
