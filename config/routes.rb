Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  get 'games/:id/status' => 'games#status'
  resources :games
end
