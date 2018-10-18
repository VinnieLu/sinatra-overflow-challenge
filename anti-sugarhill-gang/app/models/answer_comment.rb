class AnswerComment < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user
  belongs_to :answer
end
