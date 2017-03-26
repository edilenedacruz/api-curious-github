class User::ReposController < ApplicationController
  before_action :authorize!
  def index
    @repos = GithubUser.new(current_user).repos
  end
end
