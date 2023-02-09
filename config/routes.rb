# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "main#index"

  # Nested resources
  resources :users do
    resources :gardens
  end  

  get 'users/show'
  # Later:
  # get 'profile', to: 'users#show'

  get "about", to: "about#index"

end
