# frozen_string_literal: true

# admincontroller
class AdminController < ApplicationController
  before_action :find_user, only: %i[edit update destroy]
  def index; end

  def new
    @user = User.new
  end

  def create; end

  def filltable
    @branch_name = Branch.find(params[:branch_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user.destroy!
    redirect_to new_admin_path(id: 'faculty')
  end

  def import
    User.import(params[:file])
    redirect_to new_student_path, notice: 'Students added.'
  end

  def import_faculty
    User.import(params[:file])
    redirect_to new_faculty_path, notice: 'Faculty added.'
  end

  private

  def info_params
    # byebug
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pyear, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
