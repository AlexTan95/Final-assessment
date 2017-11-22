Rails.application.routes.draw do

	root 'users#index'

	resources 'users'

	resources 'projects'

	# resources 'braintree'
	get '/search', to: "projects#search", as: "search"

	post 'braintree/checkout'

	get 'braintree/donation'

	get 'braintree/new' => 'braintree#new', as: :new_braintree

	

	#AUTHENTICATION
	get '/signup' => 'users#new'
	post '/users' => 'users#create'

	get '/login' => 'session#new'
	post '/login' => 'session#create'
	post '/logout' => 'session#destroy'
	#AUTHENTICATION


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
