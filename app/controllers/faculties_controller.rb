# frozen_string_literal: true

# Faculty controller
class FacultiesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_faculty, only: %i[edit update destroy]
  before_action :all_faculty, only: %i[edit new faculty_list]
  def new
    @faculty = User.new
  end

  def update
    # byebug
    if @faculty.update(faculty_params)
      flash[:notice] = 'Faculty updated Successfully'
      redirect_to faculty_list_faculties_path
    else
      render 'edit'
    end
  end

  def create
    @faculty = User.new(faculty_params)
    if @faculty.save(context: :faculty)
      @faculty.add_role :faculty
      redirect_to faculty_list_faculties_path, notice: 'Faculty has been added'
    else
      render 'new'
    end
  end

  def destroy
    @faculty.destroy
    redirect_to faculty_list_faculties_path
  end

  def students_search
    @students = User.with_role(:student).where(branch_id: params[:branch_id],
                                               semester_id:
      params[:semester_id])
                    .order(:enrollment)
  end

  def search_by_enrollment
    @students = User.with_role(:student).where(enrollment: params[:enrollment])
  end

  # def search
  #   @user = User.with_role(:student).where(branch_id: params[:branch_id],
  #                                          semester_id: params[:semester_id])
  #               .order(:enrollment)
  #   render json: { name: @user }
  # end

  # def search_by_enrollment
  #   @user = User.with_role(:student).where(enrollment: params[:enrollment])
  #   render json: { name: @user }
  # end

  private

  def faculty_params
    params.required(:user).permit(:enrollment, :sem, :branch_id, :status,
                                  :pass_out_year, :password, :email, :fname, :lname,
                                  :mobile, :password_confirmation)
  end

  def find_faculty
    @faculty = User.find(params[:id])
  end

  def all_faculty
    @faculties = User.with_role :faculty
  end
end
