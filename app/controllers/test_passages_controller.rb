class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else 
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call 
    Gist.create!(url: result.html_url, user: current_user, question: @test_passage.current_question) if result.present?

    flash_options = if result.html_url.present?
      { notice: view_context.link_to(t('.success'), result.html_url).html_safe }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
