class Answer < ApplicationRecord
  belongs_to :question
  scope :correct_answers, -> { where(correct: true) }
  validate :max_min_answers

  private

  def max_min_answers
    errors.add(:question, message: "Must be between 1 and 4 answers") if question.answers.count >= 4
  end
end
