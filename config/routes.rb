Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "rooms#index"

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
  get '/users/:id', to: 'users#show', as: 'user'
  patch '/users/:id', to: 'users#update', as: 'update_user'

  get '/users/:id/profile/edit', to: 'profiles#edit', as: 'edit_profile'
  get '/users/:id/profile', to: 'profiles#show', as: 'profile'
  patch '/users/:id/profile/edit', to: 'profiles#update', as:'update_profile'

  get '/signin', to: 'session#new', as:'signin'
  post '/signin', to: 'session#create'
  get '/signout', to: 'session#destroy'

  get '/rooms', to: 'rooms#index'
  get '/rooms/own', to: 'rooms#own', as: 'room_own'
  post '/rooms', to: 'rooms#create'
  get '/rooms/new', to: 'rooms#new', as: 'new_room'
  get '/rooms/:id', to: 'rooms#show', as: 'room'

  get '/reservations', to: 'reservations#index'
  post '/reservations', to: 'reservations#create'
  get '/reservations/new', to: 'reservations#new', as: 'new_reservation'
  post '/reservations/confirm', to: 'reservations#confirm'

end
