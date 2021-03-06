Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :books do
    resource :favorite, only: [:create, :destroy], as: 'favorites'
    resource :book_comments, only: [:create, :destroy], as: 'book_comments'
  end

  get '/home/about' => 'homes#about'
  root 'homes#top'
  patch '/users/:id/edit' => 'users#update'
end
