class AddSubjectToExam < ActiveRecord::Migration[6.0]
  def change
    add_reference :exams, :subject, foreign_key: true
  end
end
