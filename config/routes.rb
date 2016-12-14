Rails.application.routes.draw do

  resources :artists do
    resources :songs, only: [:new, :create]
  end 

  resources :songs, only: [:index, :show, :edit, :update, :destroy]
  resources :playlists
end
