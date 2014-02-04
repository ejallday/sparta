Sparta::Application.routes.draw do
  resource :session, only: [:create, :destroy, :new]
  resources :users, controller: 'users'

  namespace :admin do
    resources :courses
    resource :dashboard, only: [:show]
    resources :available_teachers, only: [:index]
  end

  namespace :teachers do
    resources :assignments
    resources :courses, only: [:index, :show]
    resource :dashboard, only: [:show]
  end

  namespace :students do
    resource :dashboard, only: [:show]
  end

  namespace :guardians do
    resource :dashboard, only: [:show]
  end

  root :to => 'sessions#new'
end
