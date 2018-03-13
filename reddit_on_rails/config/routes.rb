Rails.application.routes.draw do
  resources :users
  resources :subs

  resources :comments, only: [:create, :show]
  resources :posts do
    resources :comments, only: [:new]
  end

  resource :session
end
