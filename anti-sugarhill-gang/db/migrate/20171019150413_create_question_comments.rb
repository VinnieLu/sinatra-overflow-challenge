class CreateQuestionComments < ActiveRecord::Migration[5.0]
  def change
    create_table :question_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
