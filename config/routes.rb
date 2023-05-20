Rails.application.routes.draw do
  devise_for :players, :controllers => { registrations: 'players/registrations' }
  resources :games
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/mainpage/', to: 'players#mainPage'
  get "/playerGames/:id", to: 'games#playerGames', as: :playerGames_path
  get '/gameDetails/:id', to: 'games#gameDetails'
  # Defines the root path route ("/")
  root "players#mainPage"
end
