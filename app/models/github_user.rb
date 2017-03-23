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
    service.get_starred
  end

  def followers
    service.get_followers
  end

  def following
    service.get_following
  end

  def repos
    Repo.repos(current_user)
  end

  def organizations
    service.get_organizations
  end

  def my_recent_activity
    service.get_my_recent_activity
  end

end
