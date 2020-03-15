# frozen_string_literal: true

# add subject
class SubjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_subjects, only: %i[edit update destroy]
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    # byebug
    @subject = Subject.new(subject_params)
    if @subject.save
      redirect_to subjects_path, notice: 'Subject added Successfully'
    else
      flash[:alert] = 'Something went wrong!'
      render 'new'
    end
  end

  def update
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: 'Subject updated Successfully'
    else
      flash[:alert] = 'Something went wrong!'
      render 'edit'
    end
  end

  def destroy
    @subject.destroy
    redirect_to subjects_path
  end

  private

  def subject_params
    params.required(:subject).permit(:branch_id, :semester_id, :name)
  end

  def find_subjects
    @subject = Subject.find(params[:id])
  end
end
