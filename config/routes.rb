Rails.application.routes.draw do
  root "main#index"
  resources :users
  resources :sessions
  resources :the_discussions
  resources :posts
  get 'the_discussions/index/:id' => 'the_discussions#index'
end
