# frozen_string_literal: true

# add date to exams
class AddDateToExams < ActiveRecord::Migration[6.0]
  def change
    add_column :exams, :start_date, :datetime
    add_column :exams, :end_date, :datetime
  end
end
