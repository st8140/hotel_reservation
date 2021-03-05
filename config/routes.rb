Rails.application.routes.draw do
  resources :rooms
  resource :user, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :users, only: [:index, :show]
  
  get 'account', to: 'users#show'
  get 'signup', to: 'users#new'
  get 'login', to: 'users#login_form' 
  post 'login', to: 'users#login'
  post 'logout', to: 'users#logout'
  
  get '/', to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
