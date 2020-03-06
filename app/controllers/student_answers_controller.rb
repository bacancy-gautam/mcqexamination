# frozen_string_literal: true

# exam from student side
class StudentAnswersController < ApplicationController
  before_action :find_exam, only: %i[new create]
  def new
    @question = Question.new
    @questions = @exam.questions
  end

  def create
    @count = 0
    # @questions = @exam.questions
    # binding.pry
    params[:question].each do |q, o|
      @count += 1 if Option.where(id: o).pluck(:answer).first
      save_my_selected(q, o)
    end
  end

  private

  def save_my_selected(q, o)
    my_answer = UserAnswer.new
    my_answer.question_id = q
    my_answer.option_id = o
    my_answer.user_id = current_user.id
    my_answer.exam_id = @exam.id
    my_answer.save
  end

  def find_exam
    @exam = Exam.find(params[:exam_id])
  end
end
