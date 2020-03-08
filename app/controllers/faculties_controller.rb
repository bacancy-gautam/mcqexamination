# frozen_string_literal: true

# Faculty controller
class FacultiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_faculty, only: %i[edit update destroy]
  before_action :all_faculty, only: %i[edit new]
  def new
    @faculty = User.new
  end

  def update
    # byebug
    if @faculty.update(faculty_params)
      redirect_to new_faculty_path, notice: 'Faculty updated Successfully'
    else
      render 'edit'
    end
  end

  def create
    @faculty = User.new(faculty_params)
    if @faculty.save
      @faculty.add_role :faculty
      redirect_to new_faculty_path, notice: 'Faculty has been added'
    else
      render 'new'
    end
  end

  def destroy
    @faculty.destroy
    redirect_to new_faculty_path
  end

  private

  def faculty_params
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pyear, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end

  def find_faculty
    @faculty = User.find(params[:id])
  end

  def all_faculty
    @users = User.with_role :faculty
  end
end
