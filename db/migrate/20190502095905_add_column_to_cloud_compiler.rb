class AddColumnToCloudCompiler < ActiveRecord::Migration[5.1]
  def change
    add_column :cloud_compilers, :input, :text
  end
end
