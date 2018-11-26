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

  # def new
  #   @question = Question.new
  # end

  # def edit
  # end

  # def update
  #   if @question.update(question_params)
  #     redirect_to @question
  #   else
  #     render :edit
  #   end
  # end

  # def create
  #   question = @test.questions.build(question_params)
  #   question.save!
  #   render plain: question.inspect
  # end

  # def destroy
  #   @question.destroy!
  #   redirect_to root_path
  # end

  private
  # def question_params
  #   params.require(:question).permit(:body)
  # end

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
