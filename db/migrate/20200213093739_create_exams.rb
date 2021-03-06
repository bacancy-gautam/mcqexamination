class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|

      t.string :name

      t.string :info

      t.integer :duration

      t.integer :pmarks

      t.string :etype
      
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
