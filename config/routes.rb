Rails.application.routes.draw do
  devise_for :users
  
  get '/' => "home#top"
  get '/posts/map'=> "posts#map"

  resources :users, except: [:destroy, :index]

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
