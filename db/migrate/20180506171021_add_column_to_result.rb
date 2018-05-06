class AddColumnToResult < ActiveRecord::Migration[5.1]
  def change
    add_column :results, :code, :text
    add_column :results, :language, :string
  end
end
