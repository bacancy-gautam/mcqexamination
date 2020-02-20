Rails.application.routes.draw do
  resources :faculty
  get "student/download_excel"
  resources :student
  resources :admin
  resources :admin do
    collection { post :import }
  end
  
  get "admin/filltable"
  root 'users#home'

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
