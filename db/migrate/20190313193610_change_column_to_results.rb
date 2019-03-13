class ChangeColumnToResults < ActiveRecord::Migration[5.1]
  def change
    change_column :results, :user_id, :integer, limit: 8, null: false
    change_column :results, :question_id, :integer, limit: 8, null: false
  end
end
