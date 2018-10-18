class Question < ApplicationRecord
  validates :question, presence: true
  belongs_to :user
  has_many :answers
  has_many :question_votes
  has_many :question_comments

  def score
  	self.question_votes.where(up: 1).count - self.question_votes.where(down: -1).count
  end



end
