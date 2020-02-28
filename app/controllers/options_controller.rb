# frozen_string_literal: true

# Option Controller
class OptionsController < ApplicationController
  # before_action :set_exam, only: [:edit, :update]

  def index
    # byebug
    @options = Option.where(question_id: params[:question_id].to_i)
  end

  def new
    @option = Option.new
    @options = Option.all
  end

  def create
    @option = Option.new(info_params)

    if @option.save!
      flash[:notice] = 'Option added successfully!'
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  def show; end

  def edit
    # byebug
    @option = Option.find(params[:id])
  end

  def update
    # byebug
    @option = Option.find(params[:id])
    # byebug
    if @option.update(info_params)
      flash[:notice] = 'Option updated Successfully'
      redirect_to exam_question_options_path
    else
      flash[:alert] = 'Something went wrong!'
    end
  end

  def info_params
    params.required(:option).permit(:opt, :question_id)
  end

  def destroy
    byebug
    @option = Option.find(params[:id])
    @option.destroy!
    redirect_to exam_question_options_path
  end
end
