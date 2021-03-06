class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|

      t.integer :score
      t.string :string
      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
