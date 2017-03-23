class OthersEvent
  attr_reader :type, :login, :repo_name, :repo_url, :created_at
  def initialize(attrs = {})
    @type = attrs[:type]
    @login = attrs[:actor][:login]
    @repo_name = attrs[:repo][:name]
    @repo_url = attrs[:repo][:url]
    @created_at = attrs[:created_at]
  end

  def self.activities(current_user)
    GithubService.new(current_user).get_activity_from_others.map do |activity|
      OthersEvent.new(activity)
    end
  end
end
