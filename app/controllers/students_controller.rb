# frozen_string_literal: true

# controller for student related task
class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_student, only: %i[edit update destroy]
  before_action :all_exams, only: %i[exam_list]
  before_action :all_students, only: :students_list
  def new
    @user = User.new
  end

  def create
    # byebug
    @user = User.new(student_params)
    if @user.save(context: :student)
      @user.add_role :student
      redirect_to students_list_admin_index_path, notice: 'Student #been added!'
    else
      flash[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def destroy
    @user.destroy
    redirect_to students_list_admin_index_path
  end

  def download_excel
    send_file(
      "#{Rails.root}/public/v1.csv",
      filename: 'add_student.csv',
      type: 'application/csv'
    )
    # redirect_to new_student_path
  end

  private

  def student_params
    params.required(:user).permit(:enrollment, :semester_id, :branch_id,
                                  :status, :pass_out_year, :password, :email,
                                  :fname, :lname, :mobile,
                                  :password_confirmation)
  end

  def find_student
    @user = User.find(params[:id])
  end

  def all_students
    @students = User.with_role :student
  end

  def all_exams
    @exams = current_user.assigns
    @exams_remaining = current_user.assigns.where.not(exam_id: Result.pluck(:exam_id))
    @exams_attempted = current_user.assigns.where(exam_id: Result.pluck(:exam_id))
  end
end
