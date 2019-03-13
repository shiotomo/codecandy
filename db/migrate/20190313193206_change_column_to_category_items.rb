class ChangeColumnToCategoryItems < ActiveRecord::Migration[5.1]
  def change
    change_column :category_items, :question_id, :integer, limit: 8, null: false
    change_column :category_items, :category_id, :integer, limit: 8, null: false
  end
end
