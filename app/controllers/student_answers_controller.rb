# frozen_string_literal: true

# exam from student side
class StudentAnswersController < ApplicationController
  before_action :find_exam, only: %i[new create show edit]
  def new
    @result = current_user.results.where(exam_id: @exam.id)
    unless @result.blank?
      # binding.pry
      redirect_to student_exam_result_path(current_user.id, @exam.id,
                                           @result.first.id),
                  alert: 'You have already submitted exam!'
    end
    @question = Question.new
    @questions = @exam.questions
  end

  def show
    @questions = @exam.questions
    @useranswers = UserAnswer.where(exam_id: params[:exam_id],
                                    user_id: params[:id])
  end

  def edit
    @questions = @exam.questions
    @useranswer = UserAnswer.where(exam_id: params[:exam_id],
                                   user_id: params[:id])
  end

  def create
    @count = 0
    params[:question].each do |question, option|
      @count += 1 if Option.where(id: option).pluck(:answer).first
      save_my_selected(question, option)
    end

    @result = Result.new(score: @count, user_id: current_user.id,
                         exam_id: @exam.id)
    if @result.save
      # @result_ = current_user.results.where(exam_id: @exam.id).first
      # binding.pry
      redirect_to student_exam_result_path(current_user.id,
                                           @exam.id, @result.id),
                  notice: 'Exam submitted!'
    else
      redirect_to student_exam_result_path(current_user.id, @exam.id,
                                           @result.id),
                  alert: 'Error Occured!'
    end
  end

  private

  def save_my_selected(question, option)
    my_answer = UserAnswer.new(question_id: question, option_id: option,
                               user_id: current_user.id, exam_id: @exam.id)
    my_answer.save
  end

  def find_exam
    @exam = Exam.find(params[:exam_id])
  end
end
