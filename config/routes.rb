Rails.application.routes.draw do
  root 'shifts#index'

  resources :shifts, only: [:index, :new, :create, :edit, :update]

  resources :users, only: [:new, :create]

  resources :productions, only: [:new, :create, :edit, :update]
end
