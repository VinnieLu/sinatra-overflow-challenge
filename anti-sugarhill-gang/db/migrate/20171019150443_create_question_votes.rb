class CreateQuestionVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :question_votes do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :up
      t.integer :down

      t.timestamps
    end
  end
end