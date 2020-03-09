# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#home'
  resources :faculties
  resources :subjects
  # resources :exams do
  # end
  post '/exams/:exam_id/assigns/new' => 'assigns#create'
  resources :exams do
    get 'student_exam'
    post 'count_result'
    resources :student_answers
    resources :assigns
    resources :questions do
      resources :options
    end
  end

  # resources :questions do
  #   resources :options
  # end

  resources :students do
    get 'download_excel', on: :collection
    resources :exams do
      resources :results
      resources :student_answers
    end
  end
  resources :admin
  resources :admin do
    collection { post :import }
    collection { post :import_faculty }
  end

  get 'admin/filltable'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
