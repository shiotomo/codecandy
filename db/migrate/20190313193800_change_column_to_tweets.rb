class ChangeColumnToTweets < ActiveRecord::Migration[5.1]
  def change
    change_column :tweets, :user_id, :integer, limit: 8, null: false
  end
end
