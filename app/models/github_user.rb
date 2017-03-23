class GithubUser
  attr_reader :service, :current_user
  def initialize(current_user)
    @service ||= GithubService.new(current_user)
    @current_user = current_user
  end

  def profile
    service.get_profile
  end

  def starred
    Star.stars(current_user)
  end

  def followers
    Follower.followers(current_user)
  end

  def following
    Following.following(current_user)
  end

  def repos
    Repo.repos(current_user)
  end

  def organizations
    Organization.organizations(current_user)
  end

  def recent_events
    Event.activities(current_user)
  end

  def activity_from_others
    OthersEvent.activities(current_user)
  end

end
