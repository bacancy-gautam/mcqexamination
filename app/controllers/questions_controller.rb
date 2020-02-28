# frozen_string_literal: true

# Question Controller
class QuestionsController < ApplicationController
  def index
    # byebug
    find_exam
    @questions = @exam.questions
  end

  def new
    @question = Question.new
    @questions = Question.all
  end

  def create
    # binding.pry
    @question = Question.new(info_params)
    # @question.exam_id = params[:exam_id]
    find_exam
    a = @exam.questions.build(info_params)

    if a.save!
      flash[:notice] = 'Question added successfully!'
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  # def saveoption
  #   @option = Option.new(info_params1)
  #   @option.question_id = @question.id
  #   if @option.save!
  #     flash[:notice] = 'Question added Successfully!'
  #     redirect_to new_exam_question_path
  #   else
  #     flash[:alert] = 'Something went wrong'
  #   end
  # end

  def show; end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    # byebug
    @question = Question.find(params[:question][:id])
    if @question.update(info_params)
      flash[:notice] = 'Question updated Successfully'
      redirect_to exam_questions_path
    else
      flash[:alert] = 'Something went wrong!'
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to exam_questions_path
  end

  def info_params
    params.required(:question).permit(:info, :answer, :exam_id, options_attributes: %i[opt _destroy])
  end

  def info_params1
    params.required(:question).permit(:opt)
  end

  def find_exam
    @exam = Exam.find(params[:exam_id])
  end
end
