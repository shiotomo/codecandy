class CreateCloudCompilers < ActiveRecord::Migration[5.1]
  def change
    create_table :cloud_compilers do |t|
      t.integer :user_id, limit: 8, null: false
      t.text :code
      t.string :language

      t.timestamps
    end
  end
end
