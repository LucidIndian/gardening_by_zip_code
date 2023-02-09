# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :gardens
  devise_for :users
  
  root to: "main#index"

  get "about", to: "about#index"

end
