Rails.application.routes.draw do
  devise_for :users
  resources :friend_contacts
  #root 'home#index'
  root 'friend_contacts#index'
  get "home/about", to: "home#about"
end
