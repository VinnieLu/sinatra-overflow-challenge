class CreateAnswerVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_votes do |t|
      t.integer :user_id
      t.integer :answer_id
      t.integer :up
      t.integer :down

      t.timestamps
    end
  end
end