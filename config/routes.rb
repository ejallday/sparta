Sparta::Application.routes.draw do
  resource :session, only: [:create, :destroy, :new]
  resources :users, controller: 'users'

  namespace :admin do
    resources :courses
    resource :dashboard, only: [:show]
    resources :available_teachers, only: [:index]
  end

  namespace :teacher do
    resources :assignments
    resources :courses, only: [:index]
    resource :dashboard, only: [:show]
  end

  root :to => 'sessions#new'
end
