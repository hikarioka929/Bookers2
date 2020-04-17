Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users
  get '/home/about' => 'homes#about'
  root 'homes#top'
  patch '/users/:id/edit' => 'users#update'
end
