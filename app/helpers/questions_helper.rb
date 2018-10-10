module QuestionsHelper
  def question_header
    if @test.present?
      @test.title
    else
      @question.test.title
    end
  end
end
