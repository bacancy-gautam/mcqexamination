# frozen_string_literal: true

# Exam assign controller
class AssignsController < ApplicationController
  before_action :authenticate_user!
  def new
    @exam = Exam.find(params[:exam_id])
    @semester = @exam.subject.semester
    @branch = Branch.find(@exam.user.branch_id)
    @students = @branch.users.with_role(:student).where(semester: @semester.sem)
    @assign = Assign.new
  end

  def create
    @assign = assign_params
    @assign['student_ids']&.each do |assign|
      @new_assign = Assign.new(exam_id: @assign['exam_id'], user_id: assign)
      assign_student
    end
    redirect_to new_exam_assign_path
  end

  def search
    @user = User.where(pass_out_year: params[:pass_out_year])
    # byebug
  end

  private

  def assign_student
    flash[:notice] = 'Exam has been assigned!' if @new_assign.save
  rescue StandardError
    flash[:notice] = 'Exam Assigned and students skipped who are already
                        assigned!'
  end

  def assign_params
    params.permit(:exam_id, student_ids: [])
  end
end
