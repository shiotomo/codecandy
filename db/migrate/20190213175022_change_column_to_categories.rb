class ChangeColumnToCategories < ActiveRecord::Migration[5.1]
  def change
    add_index :categories, :title, unique: true
  end
end
