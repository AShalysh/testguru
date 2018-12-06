class Admin::QuestionsController < Admin::BaseController

  before_action :find_test, only: [:index, :new, :create, :edit, :update]
  before_action :find_question, only: [:show, :destroy, :edit, :update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show 
  end  

  def new
    @question = Question.new
  end

  def edit
  end

  def update
    if @question.update!(question_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def create
    question = @test.questions.build(question_params)
    question.save!
    redirect_to admin_test_path(@test)
  end

  def destroy
    @question.destroy!
    redirect_to admin_test_path(@test)
  end  

  private

  def question_params
    params.require(:question).permit(:body)
  end

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
