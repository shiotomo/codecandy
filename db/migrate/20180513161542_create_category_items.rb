class CreateCategoryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :category_items do |t|
      t.integer :category_id, null: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
