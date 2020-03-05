class RemoveBranchFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :branch
  end
end
