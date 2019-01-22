class RemoveTypeFromTweet < ActiveRecord::Migration[5.1]
  def change
    remove_column :tweets, :type, :string
  end
end
