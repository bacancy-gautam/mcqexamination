class RenameOptToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :options, :opt, :name
  end
end
