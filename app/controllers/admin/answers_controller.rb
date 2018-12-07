class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create index update edit destroy]
  before_action :find_answer, only: %i[show edit update destroy]
  #before_action :find_test, only: [:index, :new, :create, :edit, :update]

  def index
    @answers = @question.answers
  end  

  def show
  end

  def new
    @answer = @question.answers.new
  end

  def edit
  end

  def create
    #@answer = Answer.new(answer_params)
    @answer = @question.answers.build(answer_params)
    @answer.save!

    if @answer.save
      redirect_to admin_question_path(@answer.question)
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to admin_question_answers_path(@question)   
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy!
    redirect_to admin_question_answers_path(@question)
  end

  private

    def find_test
      #@test = Test.find(params[:test_id])
    end
    
    def find_question
      @question = Question.find(params[:question_id]) 
    end

    def find_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:body, :correct, :question_id)
    end
end
