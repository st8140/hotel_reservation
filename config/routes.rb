Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  
  resources :rooms
  # resource :user, only: [:edit, :update, :show, :destroy]
  # resources :users, only: [:new, :create, :index, :show]
  
  get 'users/account' => 'users#show'
  
  devise_scope :user do
    get '/users/profile' => 'users/registrations#profile_edit', as: 'profile_edit'
    patch '/users/profile_update' => 'users/registrations#profile_update', as: 'profile_update'
  end
  
  
  get '/' => 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
