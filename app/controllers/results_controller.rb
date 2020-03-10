# frozen_string_literal: true

# Result Controller
class ResultsController < ApplicationController
  before_action :authenticate_user!
  def index
    @exam = Exam.find(params[:exam_id])
    @results = @exam.results
  end

  def show
    @result = Result.find(params[:id])
    @questions_count = @result.exam.questions.count
    @exam = Exam.find(params[:exam_id])
  end
end
