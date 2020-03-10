# frozen_string_literal: true

# controller to create exam
class ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_exam, only: %i[edit update destroy student_exam]
  before_action :check_branch, only: :new
  def index
    @exams = current_user.exams
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = current_user.exams.build(exam_params)
    # byebug
    if @exam.save
      redirect_to new_exam_path, notice: 'Exam added Successfully'
    else
      render 'new'
    end
  end

  def update
    if @exam.update(exam_params)
      redirect_to exams_path, notice: 'Exam updated Successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @exam.destroy
    redirect_to exams_path, alert: 'Exam Deleted Successfully'
  end

  def student_exam
    @questions = @exam.questions
  end

  private

  def exam_params
    params.required(:exam).permit(:name, :info, :duration, :pmarks,
                                  :subject_id, :start_date, :end_date,
                                  :etype)
  end

  def find_exam
    @exam = Exam.find(params[:id])
  end

  def check_branch
    if current_user.branch.subjects.blank?
      flash[:alert] = 'Ask admin to add subject to your branch!'
      redirect_to exams_path
    end
  end
end
