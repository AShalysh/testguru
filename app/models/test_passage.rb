class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
      # Update score
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def score
    (correct_questions.to_f / number_of_questions) * 100.0
  end

  def success?
    self.score >= 85
  end

  def question_number
    questions.where('id <= ?', current_question.id).count
  end

  def total_questions
    questions.count
  end

  private

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    # comparing ids of chosen answers and correct answers. Array is making sure we have array but not nil
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def questions
    test.questions
  end

  def next_question   
    if self.current_question.nil?
      questions.first 
    else
      questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def set_next_question
    self.current_question = next_question
  end

  def number_of_questions
    questions.count
  end

end
