Rails.application.routes.draw do
  get 'sessions/new'

  root   'static_pages#home'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show, :index]
	match '/signup', to: 'users#new', via: 'get'

	resources :events, only: [:new, :create, :show, :index]
  resources :invites,             only: [:create]

end
