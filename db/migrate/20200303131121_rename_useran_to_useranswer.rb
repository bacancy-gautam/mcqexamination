# frozen_string_literal: true

# rename table name
class RenameUseranToUseranswer < ActiveRecord::Migration[6.0]
  def change
    rename_table :userans, :user_answers
  end
end
