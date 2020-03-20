# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#home'
  resources :faculties do
    get 'faculty_list', on: :collection
    get 'students_list', on: :collection
    get 'search', on: :collection
    get 'search_by_enrollment', on: :collection
    resources :exams do
      resources :results
    end
  end
  resources :subjects
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
  resources :students do
    collection do
      get :download_excel
      get :exam_list
      get :students_list
    end
    resources :exams do
      resources :results
      resources :student_answers
    end
  end
  resources :admin do
    collection do
      post :import
      get :promote_student
      get :students_list
      get :search_students
      get :search_by_enrollment
      get :search_by_branch
      get :students_promote
      # get :students_search
    end
  end
  resources :charges
  get 'assigns/search' => 'assigns#search'
  get 'admin/filltable'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
