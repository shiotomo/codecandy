class Tweet < ActiveRecord::Migration[5.1]
  def change
    add_column :tweets, :user_id, :integer, null: false
  end
end
