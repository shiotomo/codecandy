class AddColumnToScore < ActiveRecord::Migration[5.1]
  def change
    add_column :scores, :question_id, :integer, null: false
  end
end
