# frozen_string_literal: true

# Result Controller
class ResultsController < ApplicationController
  before_action :authenticate_user!
  def index
    @exam = Exam.find(params[:exam_id])
    @results = @exam.results

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Result',
               page_size: 'A4',
               template: 'results/index.html.erb',
               layout: 'pdf.html',
               type: 'application/pdf',
               orientation: 'Landscape',
               disposition: 'attachment',
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end

  def show
    @result = Result.find(params[:id])
    @questions_count = @result.exam.questions.count
    @exam = Exam.find(params[:exam_id])
  end
end
