Rails.application.routes.draw do
  devise_for :players
  resources :games
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/mainpage', to: 'players#mainPage'
  # Defines the root path route ("/")
  root "players#mainPage"
end
