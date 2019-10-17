Rails.application.routes.draw do
	root "users#index"
  resources :users
  resources :pets
  resources :foods
  resources :fridges
end
