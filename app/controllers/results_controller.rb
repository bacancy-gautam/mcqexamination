# frozen_string_literal: true

# Result Controller
class ResultsController < ApplicationController
  before_action :authenticate_user!
  def show
    @result = Result.find(params[:id])
    @questions_count = @result.exam.questions.count
    @exam = Exam.find(params[:exam_id])
  end
end
