class Follower
  attr_reader :avatar_url, :login, :follower_url
  def initialize(attrs = {})
    @avatar_url = attrs[:avatar_url]
    @login = attrs[:login]
    @follower_url = attrs[:follower_url]
  end

  def self.followers(current_user)
    GithubService.new(current_user).get_followers.map do |repo|
      Follower.new(repo)
    end
  end
end
