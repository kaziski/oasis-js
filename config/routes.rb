Rails.application.routes.draw do
  
  resources :plants_actions
  unauthenticated do
    root :to => 'welcome#index'
  end
 
  authenticated do
    root :to => 'welcome#log_in_welcome'
  end

  resources :actions do  
    :plants_actions
  end

  get '/plants/in_garden', to: 'plants#in_garden'
  get '/plants/edible', to: 'plants#edible'
  get '/plants/annual', to: 'plants#annual'

  resources :plants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
