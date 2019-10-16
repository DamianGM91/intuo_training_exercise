Rails.application.routes.draw do
	root "users#index"
  resources :users
  get "/users/first_name/:first_name", to: "users#find_by_first_name"
  get "/users/last_name/:last_name", to: "users#find_by_last_name"
  resources :pets
  get "/pets/name/:name", to: "pets#find_by_name"
  get "/pets/type/:type", to: "pets#find_by_type"
end
