class CreateUserans < ActiveRecord::Migration[6.0]
  def change
    create_table :userans do |t|

      t.references :user, foreign_key: true
      t.references :exam, foreign_key: true
      t.references :option, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
