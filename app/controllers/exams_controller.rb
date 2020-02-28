# frozen_string_literal: true

# controller to create exam
class ExamsController < ApplicationController
  def index
    @exams = current_user.exams
  end

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(info_params)
    @exam.user_id = current_user.id
    @exam.subject_id = params[:subject_id]
    if @exam.save!
      flash[:notice] = 'Exam added Successfully'
      redirect_to new_exam_path
    else
      flash[:alert] = 'Exam not added'
    end
  end

  def show; end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    #  byebug
    @exam = Exam.find(params[:exam][:id])
    if @exam.update(info_params)
      flash[:notice] = 'Exam updated Successfully'
      redirect_to exams_path
    end
  end

  def destroy
    @exam = Exam.find(params[:id])
    @exam.destroy!
    flash[:alert] = 'Exam Deleted Successfully'
    redirect_to exams_path
  end

  def info_params
    params.required(:exam).permit(:name, :info, :duration, :pmarks,
                                  :subject_id, :etype)
  end
end
