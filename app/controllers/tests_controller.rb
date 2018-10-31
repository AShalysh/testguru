class TestsController < ApplicationController
  
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :find_user, only: :start
  
  def index
    #render plain: result.join("\n")
    #render html: '<h1>All tests</h1>'.html_safe
    #render file: 'public/about', layout: false
    @tests = Test.all
    # render inline: '<p> Blabla: <%= @tests.inspect %>! </p>'
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def search
    result = ["Class: #{params.class}, parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.tests.push(@test) # Create test passage here (through user tests)
    redirect_to @user.test_passage(@test)
  end

  private 

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def find_user
    @user = User.first
  end
end
