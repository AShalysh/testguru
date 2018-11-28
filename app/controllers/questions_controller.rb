class QuestionsController < ApplicationController
  # before_action :find_test, only: [:index, :new, :create]
  # before_action :find_question, only: [:show, :destroy, :edit, :update]
  before_action :find_test, only: [:index]
  before_action :find_question, only: [:show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show   
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found.'
  end
end
