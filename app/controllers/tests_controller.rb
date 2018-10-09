class TestsController < ApplicationController
  
  before_action :find_test, only: [:show, :edit, :update, :destroy]
  
  def index
    #result = ["Class: #{params.class}, parameters: #{params.inspect}"]
    #render plain: result.join("\n")
    #render html: '<h1>All tests</h1>'.html_safe
    #render inline: '<p> Blabla: <%= %[ybuR].reverse! %>! </p>'
    #render file: 'public/about', layout: false
    #head 204
    #head no_content
    #byebug
    #render inline: '<%= console %>'
    # respond_to do |format|
    #  format.html { render plain: 'All tests' }
    #  format.json {render json: { tests: Test.all }}
    # end
    @tests = Test.all
    # render inline: '<p> Blabla: <%= @tests.inspect %>! </p>'
  end

  def start
    #render plain: 'Start certain test'
    #create test user
  end

  def show
    #redirect_to root_path
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

    # result = ["Class: #{params.class}, parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    #lesson #7
    # test = Test.create!(test_params)
    # render plain: test.inspect
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

  private 

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end
end
