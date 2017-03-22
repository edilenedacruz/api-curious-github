class GithubUser
  attr_reader :service
  def initialize(current_user)
    @service ||= GithubService.new(current_user)
  end

  def profile
    @service.get_profile
  end

  def starred
    @service.get_starred
  end

end
