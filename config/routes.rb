Rails.application.routes.draw do
	root "users#index"
  resources :users
  resources :pets
  resources :foods
  resources :fridges
  resources :dogs
  resources :cats
  resources :horses
  resources :mice
  resources :breads
  resources :carrots
  resources :cheeses
  resources :grasses
  resources :meats
  resources :milks
  resources :waters
end
