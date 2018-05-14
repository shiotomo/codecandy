class AddColumnToCategoryItem < ActiveRecord::Migration[5.1]
  def change
    remove_column :category_items, :category_id, :integer
    remove_column :category_items, :question_id, :integer
    add_reference :category_items, :category
    add_reference :category_items, :question
  end
end
