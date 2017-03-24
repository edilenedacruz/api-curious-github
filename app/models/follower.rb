class Follower
  attr_reader :avatar_url, :login, :html_url
  def initialize(attrs = {})
    @avatar_url = attrs[:avatar_url]
    @login = attrs[:login]
    @html_url = attrs[:html_url]
  end

  def self.followers(current_user)
    GithubService.new(current_user).get_followers.map do |repo|
      Follower.new(repo)
    end
  end
end
