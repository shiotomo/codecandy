class ChangeColumnToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_index :questions, :title, unique: true
  end
end
