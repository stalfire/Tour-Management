Rails.application.routes.draw do
	resources :users
	resources :records

	get    '/login' => 'sessions#new'
  	post   '/login' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'

	get "/sign_up" => "users#new", as: "sign_up"

	get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  	root 'home#index'
end
