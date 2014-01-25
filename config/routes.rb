Sparta::Application.routes.draw do
  resource :session, only: [:create, :destroy, :new]
  resources :users, controller: 'users'

  namespace :admin do
    resources :courses
    resource :dashboard, only: [:show]
  end

  namespace :teacher do
    resource :dashboard, only: [:show]
    resources :assignments
  end

  root :to => 'sessions#new'
end
