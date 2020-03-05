class CreateOptionfields < ActiveRecord::Migration[6.0]
  def change
    create_table :optionfields do |t|
      t.string :name
      t.string :field_type
      t.boolean :required
      t.belongs_to :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
