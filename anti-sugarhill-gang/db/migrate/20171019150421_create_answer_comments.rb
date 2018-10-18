class CreateAnswerComments < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :answer_id

      t.timestamps
    end
  end
end