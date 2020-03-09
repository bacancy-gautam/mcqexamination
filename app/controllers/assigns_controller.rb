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
      @new_assign = Assign.new(exam_id: @assign['exam_id'], user_id: assign)
      assign_student
    end
  end

  private

  def assign_student
    begin
      mynotice = 'Exam has been assigned!' if @new_assign.save
    rescue StandardError
      e = true
    end
    if e
      mynotice = 'Exam Assigned and students skipped who are already assigned!'
    end
    redirect_to new_exam_assign_path, notice: mynotice
  end

  def assign_params
    params.permit(:exam_id, student_ids: [])
  end
end
