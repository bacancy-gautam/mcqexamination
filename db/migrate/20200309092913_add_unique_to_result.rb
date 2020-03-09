# frozen_string_literal: true

# add unique key to Result
class AddUniqueToResult < ActiveRecord::Migration[6.0]
  def change
    add_index :results, %i[user_id exam_id], unique: true
    remove_column :results, :string
  end
end
