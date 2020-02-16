Rails.application.routes.draw do
  resources :faculty
  resources :student
  resources :admin

  # get 'faculty/new'
  # get 'faculty/create'
  # get 'faculty/update'
  # get 'faculty/edit'
  # get 'faculty/destroy'
  # get 'faculty/show'
  # get 'faculty/index'
  # get 'student/new'
  # get 'student/create'
  # get 'student/update'
  # get 'student/edit'
  # get 'student/destroy'
  # get 'student/show'
  # get 'student/index'
  # get 'admin/new'
  # get 'admin/create'
  # get 'admin/update'
  # get 'admin/edit'
  # get 'admin/destroy'
  # get 'admin/show'
  # get 'admin/index'
  root 'users#home'

  devise_for :users


  # namespace :user do
  #   resources :registration

  #   end
  #   namespace :admin do
  #     resources :registration
  
  #     end
  #     namespace :faculty do
  #       resources :registration
    
  #       end

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
