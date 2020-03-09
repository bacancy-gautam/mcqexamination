# frozen_string_literal: true

# Option Controller
class OptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_option, only: %i[edit update destroy]
  before_action :find_question, only: %i[new find_exam index]
  before_action :find_exam, only: %i[new]

  def index
    # byebug
    @options = @question.options
  end

  def new
    @option = Option.new(question_id: @question)
  end

  def create
    @option = Option.new(option_params)
    @option.question_id = params[:question_id]
    # byebug
    if @option.save
      redirect_to exam_question_options_path, notice: 'Option added!'
    else
      render 'new'
    end
  end

  def update
    if @option.update(option_params)
      redirect_to exam_question_options_path, notice: 'Option updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @option.destroy
    redirect_to exam_question_options_path
  end

  private

  def option_params
    params.required(:option).permit(:name, :question_id)
  end

  def find_option
    @option = Option.find(params[:id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_exam
    @exam = Exam.find(params[:exam_id])
  end
end
