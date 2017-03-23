class Organization
  attr_reader :url, :avatar_url
  def initialize(attrs = {})
    @url = attrs[:url]
    @avatar_url = attrs[:avatar_url]
  end

  def self.organizations(current_user)
    GithubService.new(current_user).get_organizations.map do |repo|
      Organization.new(repo)
    end
  end
end
