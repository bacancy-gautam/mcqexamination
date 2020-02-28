# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#home'
  resources :faculties
  resources :subjects
 
  
  resources :exams do
    resources :questions do
      resources :options
    end
  end

  resources :questions do
    resources :options
  end


  get 'students/download_excel'
  resources :students
  resources :admin
  resources :admin do
    collection { post :import }
    collection { post :importf }
  end

  get 'admin/filltable'

  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
