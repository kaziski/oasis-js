Rails.application.routes.draw do
  
  unauthenticated do
    root :to => 'welcome#index'
  end
 
  authenticated do
    root :to => 'welcome#log_in_welcome'
  end

  resources :actions
  
  get '/plants', to: 'plants#index', as: 'plants'
  get '/plants/new', to: 'plants#new'
  post '/plants', to: 'plants#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
