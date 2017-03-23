class Event
  attr_reader :event_type, :username, :repo, :created_at, :action
  def initialize(attrs = {})
    @event_type = attrs[:type]
    @username = attrs[:actor][:login]
    @repo = attrs[:repo][:name]
    @created_at = attrs[:created_at]
    @action = attrs[:payload][:action]
  end

  def self.activities(current_user)
    GithubService.new(current_user).get_recent_activity.map do |activity|
      Event.new(activity)
    end
  end
end
