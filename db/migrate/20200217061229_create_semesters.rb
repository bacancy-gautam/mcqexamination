class CreateSemesters < ActiveRecord::Migration[6.0]
  def change
    create_table :semesters do |t|
      t.integer :sem
      t.timestamps
    end
  end
end
