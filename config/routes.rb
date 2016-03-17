Rails.application.routes.draw do
  get 'ideas/index'

  get 'ideas/new'

  get 'ideas/create'

  get 'ideas/show'

  root to: 'pages#angular'

  get 'sessions/create'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :meals, only: :index, defaults: {format: :json}  do
  	member do
	    put '/sold' => 'meals#sold'
	    put '/unsold' => 'meals#unsold'
	  end
  end

	resources :orders, only: [:index, :create, :destroy], defaults: {format: :json} do
	  member do
	    put '/delivered' => 'orders#delivered'
	  end
	end

  resources :ideas, only: [:index, :show, :new, :create], defaults: {format: :json}
end
