class GistQuestionService
  # include ActionView::Helpers::TranslationHelper

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t('services.gist_question_service.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    # content = [@question.body]
    # content += @question.answers.pluck(:body)
    # content.join("\n")
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end

end
