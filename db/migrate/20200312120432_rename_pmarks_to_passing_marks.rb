# frozen_string_literal: true

# rename and added column
class Renamepassing_marksToPassingMarks < ActiveRecord::Migration[6.0]
  def change
    # Column renamed in exams table
    rename_column :exams, :passing_marks, :passing_marks
    # Column renamed in users table
    rename_column :users, :pass_out_year, :pass_out_year
    # Column added in options table for option indexing
    add_column :options, :option_index, :string
  end
end
