class AddColumnToOptions < ActiveRecord::Migration[6.0]
  def change
    add_column :options, :option_index, :string
  end
end
