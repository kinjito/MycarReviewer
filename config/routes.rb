Rails.application.routes.draw do
  root to: 'home#top'

  get '/users/:id/password' => "users#update_password", as: :update_password
  #post '/users/change_password' => "users#change_password", as: :change_password
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  get '/posts/map'=> "posts#map"

  resources :users, except: [:destroy, :index]

  resources :posts do
      resources :car_comments, only: [:create, :destroy]
      
      resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
