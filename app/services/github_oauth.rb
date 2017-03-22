class GithubOauth
  attr_reader :code, :client_id, :client_secret, :access_token

  def initialize(code)
    @code = code
    @client_id = ENV['GITHUB_KEY']
    @client_secret = ENV['GITHUB_SECRET']
  end

  def access_token
    response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{client_id}&client_secret=#{client_secret}&code=#{code}")
    @access_token = response.body.split(/\W+/)[1]
    @access_token
  end

  def data
    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{@access_token}")
    data = JSON.parse(oauth_response.body)
    data
  end
end
