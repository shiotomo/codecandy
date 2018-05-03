class RenameScoreToResult < ActiveRecord::Migration[5.1]
  def change
    rename_table :scores, :results
  end
end
