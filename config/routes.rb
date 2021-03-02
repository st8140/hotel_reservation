Rails.application.routes.draw do
  resources :rooms
  resources :users, only: [:create, :show, :edit, :update, :destroy]
  
  get 'signup', to: 'users#new'
  get 'login', to: 'users#login_form' 
  post 'login', to: 'users#login'
  
  get '/', to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
