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

  resources :plants
  # get '/plants', to: 'plants#index'
  # get '/plants/new'
  # post '/plants', to: 'plants#create'
  get '/plants/in_garden', to: 'plants#in_garden'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end

  # post '/toys', to: 'toys#create'
  # get '/toys/:id', to: 'toys#show', as: 'toy'
  # get '/toys/:id/edit', to: 'toys#edit', as: 'toy_edit'
  # patch '/toys/:id', to: 'toys#update'
  # delete '/toys/:id', to: 'toys#destroy'
