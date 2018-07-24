class AddColumnToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :comment, :text
  end
end
