class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
    # client = GitHubClient.new
    # @gists = client.list_gists
  end
end
