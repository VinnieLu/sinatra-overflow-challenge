class Answer < ApplicationRecord
  validates :answer, presence: true
  belongs_to :user
  belongs_to :question
  has_many :answer_votes
  has_many :answer_comments
end
