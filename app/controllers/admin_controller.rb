# frozen_string_literal: true

# admincontroller
class AdminController < ApplicationController
  def index; end

  def show; end

  def new
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(info_params)
    @user.branch_id = params[:branch_id]
    if @user.save
      if @user.status.to_i == 2
        @user.add_role :student
        redirect_to new_admin_path(id: 'student')
      elsif @user.status.to_i == 1
        @user.add_role :faculty
        redirect_to new_admin_path(id: 'faculty')
      end
    else
      render :new, id: 'faculty'
    end
  end

  def filltable
    @branch_name = Branch.find(params[:branch_id])
    respond_to do |format|
      format.js
    end
  end

  def edit; end

  def update; end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to new_admin_path(id: 'faculty')
  end

  def addfaculty; end

  def import
    User.import(params[:file])
    redirect_to new_student_path, notice: 'Students added.'
  end

  def importf
    User.import(params[:file])
    redirect_to new_faculty_path, notice: 'Faculty added.'
  end

  def info_params
    puts 'hello'
    # devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:enrollment, :sem, :branch, :pyear, :encrypted_password, :email) }
    # byebug
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pyear, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end
end
