class Star
  attr_reader :full_name, :description, :url, :forks_count, :updated_at
  def initialize(attrs = {})
    @full_name = attrs[:fullname]
    @description = attrs[:description]
    @url = attrs[:url]
    @forks_count = attrs[:forks_count]
    @updated_at = attrs[:updated_at]
  end

  def self.stars(current_user)
    GithubService.new(current_user).get_starred.map do |repo|
      Star.new(repo)
    end
  end
end
