class Answer < ApplicationRecord
  belongs_to :question
  
  scope :correct, -> { where(correct: true) }

  validate :max_responds

  private

  def max_responds
    errors.add(:question, message: "Must be no more than 4 answers") if question.answers.count > 4
  end
end
