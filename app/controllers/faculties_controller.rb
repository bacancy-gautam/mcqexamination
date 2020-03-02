# frozen_string_literal: true

# Faculty controller
class FacultiesController < ApplicationController
  def index; end

  def show; end

  def new
    @user = User.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # byebug
    @user = User.find(params[:user][:id])
    if @user.update(info_params)
      flash[:notice] = 'Faculty updated Successfully'
      redirect_to new_faculty_path
    else
      flash[:alert] = 'Something went wrong!'
    end
  end

  def create
    @user = User.new(info_params)
    a = params[:branch_id]
    @user.branch_id = a
    if @user.save!
      @user.add_role :faculty
      flash[:notice] = 'Student has been added successfully'
      redirect_to new_faculty_path
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to new_faculty_path
  end

  def info_params
    # puts "fac hello"
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pyear, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end
end
