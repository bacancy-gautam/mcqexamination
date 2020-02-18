class AddExamToAssign < ActiveRecord::Migration[6.0]
  def change
    add_reference :assigns, :exam, foreign_key: true
  end
end

