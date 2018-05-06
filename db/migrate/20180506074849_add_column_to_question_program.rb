class AddColumnToQuestionProgram < ActiveRecord::Migration[5.1]
  def change
    add_column :question_programs, :user_id, :integer, null: false
    add_column :question_programs, :language, :string
  end
end
