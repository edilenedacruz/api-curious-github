class Following
  attr_reader :html_url, :login, :avatar_url
  def initialize(attrs = {})
    @html_url = attrs[:html_url]
    @login = attrs[:login]
    @avatar_url = attrs[:avatar_url]
  end

  def self.following(current_user)
    GithubService.new(current_user).get_following.map do |repo|
      Following.new(repo)
    end
  end
end
