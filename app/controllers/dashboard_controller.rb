class DashboardController < ApplicationController
  before_action :authorize!

  def index
    @github_user = GithubUser.new(current_user)
    # GithubService.new(current_user).get_profile
  end
end
