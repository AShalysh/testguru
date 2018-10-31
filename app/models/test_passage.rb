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
    if self.score >= 85
      true
    else
      false
    end
  end

  def question_number
    test.questions.index(self.current_question) + 1
  end

  def total_questions
    test.questions.count
  end

  private

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    if answer_ids.nil?
      false
    else
      correct_answers.ids.sort == answer_ids.map(&:to_i).sort
    end
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_next_question
    if self.current_question.nil?
      self.current_question = test.questions.first 
    else
      self.current_question = next_question
    end
  end

  def number_of_questions
    test.questions.count
  end

end
