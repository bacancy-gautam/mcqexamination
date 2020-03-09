# frozen_string_literal: true

# exam from student side
class StudentAnswersController < ApplicationController
  before_action :find_exam, only: :new
  def new
    @question = Question.new
    @questions = @exam.questions
  end

  def create
    # @questions = @exam.questions
    # byebug
  end

  private

  def find_exam
    @exam = Exam.find(params[:exam_id])
  end
end
