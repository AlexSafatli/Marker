Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'users/registrations' },
    :path_names => { edit: '' }

  resources :courses
  resource :profile, only: [:edit, :update]

  root 'courses#index'
  resources :courses

end