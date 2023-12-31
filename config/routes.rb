Rails.application.routes.draw do
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :songs do
  resources :likes, only: [:create, :destroy]
  end
  
  resources :users, only: [:index,:show]
  resources :messages, :only => [:create]
  resources :rooms, :only => [:index,:show,:create]

  get'songs/top'=>'songs#top'
  root 'songs#top'
  
end


