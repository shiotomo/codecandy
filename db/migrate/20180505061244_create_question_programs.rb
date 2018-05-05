class CreateQuestionPrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :question_programs do |t|
      t.integer :question_id, null: false
      t.text :code

      t.timestamps
    end
  end
end
