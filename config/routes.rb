Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  get 'users/:id', to: 'users#show'
  get 'users', to: 'users#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  root 'schedules#index'
  resources :schedules
  resources :boats
  resources :jobs

end
