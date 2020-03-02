# frozen_string_literal: true

# add subject
class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    #  @user = Usaer.new
    @subject = Subject.new
    @subjects = Subject.all
  end

  def create
    puts '   ------------------hii'
    # byebug
    @subject = Subject.new(info_params)
    @subject.branch_id = params[:branch_id]
    @subject.semester_id = params[:semester_id]
    if @subject.save
      flash[:notice] = 'Subject added Successfully'
      redirect_to subjects_path
    else
      flash[:alert] = 'Something went wrong!'

    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    @subject.branch_id = params[:branch_id]
    @subject.semester_id = params[:semester_id]
    if @subject.update(info_params)
      redirect_to subjects_path, notice: 'Subject updated Successfully'
    else
      byebug
      render 'edit'
      flash[:alert] = 'Something went wrong!'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy!
    redirect_to subjects_path
  end

  def info_params
    params.required(:subject).permit(:branch_id, :semester_id, :name)
  end
end
