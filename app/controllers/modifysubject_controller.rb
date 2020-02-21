# frozen_string_literal: true

# add subject
class ModifysubjectController < ApplicationController
  def index
    @subject = Subject.all
  end

  def new
    #  @user = Usaer.new
    @subject = Subject.new
    @subjecti = Subject.all
  end

  def create
    puts '   ------------------hii'
    # byebug
    @subject = Subject.new(info_params)
    @subject.branch_id = params[:branch_id]
    @subject.semester_id = params[:semester_id]
    if @subject.save
      flash[:notice] = 'Subject added Successfully'
      redirect_to modifysubject_index_path
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy!
    redirect_to modifysubject_index_path
  end

  def info_params
    params.required(:subject).permit(:branch_id, :semester_id, :name)
  end
end
