Sparta::Application.routes.draw do
  resource :session, only: [:create, :destroy, :new]
  resources :users, controller: 'users'

  namespace :teacher do
    resource :dashboard, only: [:show]
    resources :courses
    resources :assignments
  end

  # get 'sign_out' => 'sessions#destroy', as: 'sign_out'
  # get 'sign_in' => 'sessions#new', as: 'sign_in'
  # get 'sign_up' => 'users#new', as: 'sign_up'
  # post 'users' => 'users#create', as: :users
  root :to => 'sessions#new'
end
