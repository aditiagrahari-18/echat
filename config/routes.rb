Rails.application.routes.draw do
  post 'messages/create'
  get 'users/index'
  devise_for :users
  root 'user_pages#home'
  post 'user_pages/block'
  get 'users/invites'
  delete 'users/destroy'
  get 'users/accept_request'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
