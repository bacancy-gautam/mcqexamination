# frozen_string_literal: true

# admincontroller
class AdminController < ApplicationController
  def index; end

  def show; end

  def new
    @user = User.new
    @users = User.all
  end

  def create; end

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
    # byebug
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pyear, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end
end
