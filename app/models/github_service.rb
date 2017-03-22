class GithubService
  attr_reader :service
  def initialize
    @service ||= GithubService.new(current_user)
  end

  # def self.some_method
  #   service.something from the hash
  # end
end
