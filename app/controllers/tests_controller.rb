class TestsController < ApplicationController
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
    render inline: '<p> Blabla: <%= @tests.inspect %>! </p>'
  end

  def start
    #render plain: 'Start certain test'
    #create test user
  end

  def show
    redirect_to root_path
  end

  def new
    # controller_name
    # action_name
  end

  def create
    # result = ["Class: #{params.class}, parameters: #{params.inspect}"]
    # render plain: result.join("\n")
    test = Test.create!(test_params)
    render plain: test.inspect
  end

  def search
    result = ["Class: #{params.class}, parameters: #{params.inspect}"]
    render plain: result.join("\n")
  end

  private 

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end
end
