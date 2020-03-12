# frozen_string_literal: true

class AddColumnOnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :enrollment, :bigint
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :sem, :integer
    add_column :users, :branch, :string
    add_column :users, :mobile, :bigint
    add_column :users, :pass_out_year, :integer
    add_column :users, :status, :integer
  end
end
