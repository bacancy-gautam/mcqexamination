# frozen_string_literal: true

class AddAnswerToOptions < ActiveRecord::Migration[6.0]
  def change
    add_column :options, :answer, :boolean, default: false
  end
end
