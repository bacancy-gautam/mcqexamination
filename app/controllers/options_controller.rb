# frozen_string_literal: true

# Option Controller
class OptionsController < ApplicationController
  before_action :set_option, only: %i[edit update destroy]

  def index
    # byebug
    @options = Option.where(question_id: params[:question_id].to_i)
  end

  def new
    @option = Option.new
  end

  def create
    @option = Option.new(info_params)
    @option.question_id = params[:question_id]
    # byebug
    if @option.save
      redirect_to exam_question_options_path, notice: 'Option added!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @option.update(info_params)
      redirect_to exam_question_options_path, notice: 'Option updated!'
    else
      render 'edit'
    end
  end

  def destroy
    @option = Option.find(params[:id])
    @option.destroy
    redirect_to exam_question_options_path
  end

  private

  def info_params
    params.required(:option).permit(:opt, :question_id)
  end

  def set_option
    @option = Option.find(params[:id])
  end
end
