class RenameOptionToOpt < ActiveRecord::Migration[6.0]
  def change
    rename_column :options, :option, :opt
  end
end
