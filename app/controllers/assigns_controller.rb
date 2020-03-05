# frozen_string_literal: true

# Exam assign controller
class AssignsController < ApplicationController
  def new
    @exam = Exam.find(params[:exam_id])
    @assign = Assign.new
    @students = User.with_role :student
  end

  def create
    @assign = assign_params
    @assign['student_ids'].each do |assign|
      new_assign = Assign.new
      new_assign.exam_id = @assign['exam_id']
      new_assign.user_id = assign
      if new_assign.save
        redirect_to new_exam_assign_path, notice: 'Exam has been assigned!'
      end
    end
  end

  private

  def assign_params
    params.permit(:exam_id, student_ids: [])
  end
end
