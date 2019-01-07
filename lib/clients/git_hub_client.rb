class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = ENV['GITHUB_TOKEN']

  def initialize
    @http_client = set_http_client
  end

  #creating post request with params
  def create_gist(params)
    @http_client.create_gist(params)
    # @http_client.post('gists') do |request|
    #   request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
    #   request.headers['Content-Type'] = 'application/json'
    #   request.body = params.to_json
    # end
  end

  def list_gists
    @http_client.gists
  end  

  private

  def set_http_client
    Octokit::Client.new(:access_token => ACCESS_TOKEN)
    # Faraday.new(url: ROOT_ENDPOINT)
  end

end
