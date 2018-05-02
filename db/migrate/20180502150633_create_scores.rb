class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.boolean :answer, null: false, default: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
