Rails.application.routes.draw do
  resources :rooms
  resources :users
  
  get '/', to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end