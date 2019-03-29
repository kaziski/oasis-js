Rails.application.routes.draw do
  resources :plants
  root 'welcome#index'
  # unauthenticated do
  #   root :to => 'welcome#index'
  # end
 
  # authenticated do
  #   root :to => 'plant#index'
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
