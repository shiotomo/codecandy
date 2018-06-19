class RemoveColumnToQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :category_id, :integer
  end
end
