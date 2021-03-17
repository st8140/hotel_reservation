Rails.application.routes.draw do
  get '/' => 'home#top'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  devise_scope :user do
    get '/users/profile' => 'users/registrations#profile_edit', as: 'profile_edit'
    patch '/users/profile_update' => 'users/registrations#profile_update', as: 'profile_update'
  end
  get 'users/account' => 'users#show'
  
  get '/rooms/index' => 'rooms#index'
  get '/rooms/posts' => 'rooms#show'
  get '/rooms/new' => 'rooms#new', as: 'new_room'
  post '/rooms/create' => 'rooms#create', as: 'rooms'
  
  resources :rooms do
    collection do
      get 'search'
    end
    resources :reservations
    post 'reservations/confirm' => 'reservations#confirm'
    post 'reservations/create' => 'reservations#create'
  end 

  get 'reservations' => 'reservations#index', as: 'reservations_index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
