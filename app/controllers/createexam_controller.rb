# frozen_string_literal: true

# controller to create exam
class CreateexamController < ApplicationController
  def index
    @exam = Exam.where('user_id = ?', current_user.id)
    # Client.where("orders_count = ?", params[:orders])
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
      redirect_to new_createexam_path
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  def info_params
    params.required(:exam).permit(:name, :info, :duration, :pmarks,
                                  :subject_id, :etype,)
  end
end
