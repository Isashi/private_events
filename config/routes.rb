Rails.application.routes.draw do
  root   'static_pages#home'

  resources :users, only: [:new, :create, :show]
	match '/signup', to: 'users#new', via: 'get'
end
