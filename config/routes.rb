Sparta::Application.routes.draw do
  resource :session, only: [:create, :destroy, :new]
  resources :users, controller: 'users'
  resources :invitations do
    resource :sign_up, controller: 'invitation_sign_ups'
  end

  namespace :admin do
    resource :dashboard, only: [:show]
    resources :available_teachers, only: [:index]
    resources :courses
    resources :guardians
    resources :students
  end

  namespace :teachers do
    resources :assignments
    resources :courses, only: [:index, :show]
    resource :dashboard, only: [:show]
  end

  namespace :students, only: [:show] do
    resource :dashboard, only: [:show]
  end

  namespace :guardians do
    resource :dashboard, only: [:show]
  end

  root :to => 'sessions#new'
end
