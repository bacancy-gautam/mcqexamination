class RemoveSemFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :sem
    add_reference :users, :semester, foreign_key: true
  end
end
