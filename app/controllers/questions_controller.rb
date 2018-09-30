class QuestionsController < ApplicationController

  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

#http://localhost:3000/tests/1/questions
  def index
    @questions = @test.questions
    # @questions = Question.where(test: @test)
    render 'index'
  end

  #http://localhost:3000/tests/1/questions/1
  def show 
    @question = Question.find(params[:id])
  end  

  def new
    
  end

  def create
    question = Question.create!(question_params)
    render plain: question.inspect
  end

  def destroy
    ##
    @question = Question.find(params[:id])
    @question.destroy!
    redirect_to root_path
  end  

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end
end
