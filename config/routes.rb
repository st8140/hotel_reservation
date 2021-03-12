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
  
  get '/rooms/posts' => 'rooms#index'
  resources :rooms, only: [:new, :create, :show, :edit, :update, :destroy]
 
  resources :reservations, only: [:new, :create, :show] do
    collection do
      post :confirm
    end
  end  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
