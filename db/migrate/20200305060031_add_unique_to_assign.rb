# frozen_string_literal: true

# Add unique to assign
class AddUniqueToAssign < ActiveRecord::Migration[6.0]
  def change
    add_index(:assigns, %i[user_id exam_id], unique: true)
  end
end
