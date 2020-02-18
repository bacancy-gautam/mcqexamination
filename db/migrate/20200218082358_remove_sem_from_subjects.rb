class RemoveSemFromSubjects < ActiveRecord::Migration[6.0]
  def change

    remove_column :subjects, :sem
    remove_column :subjects, :branch

    add_reference :subjects, :semester, foreign_key: true
    add_reference :subjects, :branch, foreign_key: true


  end
end
