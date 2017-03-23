class GithubService
  attr_reader :auth, :username, :access_token, :connect

  def initialize(current_user)
    @username = current_user.username
    @access_token = current_user.token
  end

  def connect
    Faraday.new(:url => 'https://api.github.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
      faraday.params[:access_token] = @access_token
    end
  end

  def get_profile
    parse(connect.get "/user")
  end

  def get_starred
    parse(connect.get "users/#{username}/starred")
  end

  def get_followers
    parse(connect.get "users/#{username}/followers")
  end

  def get_following
    parse(connect.get "users/#{username}/following")
  end

  def get_repos
    parse(connect.get "users/#{username}/repos")
  end

  def get_organizations
    parse(connect.get "user/orgs")
  end

  def get_my_recent_activity
    parse(connect.get "users/#{usernames}/events")
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
