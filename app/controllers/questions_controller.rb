# frozen_string_literal: true

# Question Controller
class QuestionsController < ApplicationController
  before_action :find_question, only: %i[edit update destroy]
  before_action :find_exam, only: %i[index create new]
  def index
    # byebug
    @questions = @exam.questions
  end

  def new
    @question = @exam.questions.build
  end

  def create
    # binding.pry
    @question = Question.new(info_params)
    a = @exam.questions.build(info_params)
    if a.save
      redirect_to exam_questions_path, notice: 'Question added!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    # byebug
    if @question.update(info_params)
      redirect_to exam_questions_path, notice: 'Question updated Successfully'
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to exam_questions_path
  end

  private

  def info_params
    params.required(:question).permit(:info, :answer, :exam_id,
                                      options_attributes: %i[opt _destroy])
  end

  def find_exam
    @exam = Exam.find(params[:exam_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
