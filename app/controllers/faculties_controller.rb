# frozen_string_literal: true

# Faculty controller
class FacultiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_faculty, only: %i[edit update destroy]
  before_action :all_faculty, only: %i[edit new]
  def new
    @user = User.new
  end

  def update
    # byebug
    if @user.update(faculty_params)
      redirect_to new_faculty_path, notice: 'Faculty updated Successfully'
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(faculty_params)
    @user.branch_id = params[:branch_id]
    if @user.save
      @user.add_role :faculty
      redirect_to new_faculty_path, notice: 'Faculty has been added'
    else
      render 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to new_faculty_path
  end

  private

  def faculty_params
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pyear, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end

  def find_faculty
    @user = User.find(params[:id])
  end

  def all_faculty
    @users = User.with_role :faculty
  end
end
