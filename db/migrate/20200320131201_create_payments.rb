# frozen_string_literal: true

# fee submission
class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :semester, foreign_key: true
      t.boolean :paid
      t.timestamps
    end
  end
end
