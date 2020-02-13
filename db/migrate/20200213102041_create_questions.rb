class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.integer :sem
      t.string :info
      t.string :answer
      t.references :exam, foreign_key: true
      t.timestamps
    end
  end
end
