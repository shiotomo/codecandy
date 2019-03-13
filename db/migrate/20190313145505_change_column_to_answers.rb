class ChangeColumnToAnswers < ActiveRecord::Migration[5.1]
  def change
    change_column :answers, :question_id, :integer, limit: 8, null: false
  end
end
