class DashboardController < ApplicationController
  before_action :authorize!

  def index
    @github_user = GithubUser.new(current_user)
    @organizations = GithubUser.new(current_user).organizations
  end
end
