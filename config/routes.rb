Rails.application.routes.draw do
  
  unauthenticated do
    root :to => 'welcome#index'
  end
 
  authenticated do
    root :to => 'welcome#log_in_welcome'
  end
  
  get '/plants/in_garden', to: 'plants#in_garden'
  get '/plants/edible', to: 'plants#edible'
  get '/plants/annual', to: 'plants#annual'

  resources :plants do
    resources :actions, only: [:index]
  end
    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, only: [:index] do
    resources :plants, only: [:index]
  end
end
