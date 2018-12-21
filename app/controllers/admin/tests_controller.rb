class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: %i[show edit update destroy start]
  
  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author = current_user

    if @test.save
      # redirect_to [:admin, @test], notice: t('.success')
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('.success_update')
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
    redirect_to admin_tests_path, notice: t('.success_destroy')
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
